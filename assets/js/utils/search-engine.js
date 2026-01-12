import MenuStore from "../store/menu-store.js";
import SearchStore from "../store/search-store.js";
import { normalizeText, scoreMatch } from "./search-utils.js";

/**
 * Keresés a MenuStore-ban + (ha betöltve) a glossary cache-ben.
 * Visszaad egy egységes találatlistát (már típusjelöléssel).
 */
export function runSearch(rawQuery) {
  const q = String(rawQuery || "");
  const qNorm = normalizeText(q);

  if (qNorm.length < (SearchStore.ui.minChars || 3)) {
    return [];
  }

  const results = [];

  // -------- Topics
  for (const t of (MenuStore.topics || [])) {
    const label = t.nameHu || t.topicNameHu || t.topic_name_hu || t.name || "";
    const s = scoreMatch(normalizeText(label), qNorm);
    if (s > 0) {
      results.push({
        type: "TOPIC",
        id: Number(t.id ?? t.topicId ?? t.topic_id),
        title: label,
        score: s,
        meta: "Téma",
      });
    }
  }

  // -------- Subtopics
  for (const st of (MenuStore.subtopics || [])) {
    const label = st.nameHu || st.subtopicNameHu || st.subtopic_name_hu || st.name || "";
    const s = scoreMatch(normalizeText(label), qNorm);
    if (s > 0) {
      results.push({
        type: "SUBTOPIC",
        id: Number(st.id ?? st.subtopicId ?? st.subtopic_id),
        title: label,
        score: s,
        meta: "Lecke",
      });
    }
  }

  // -------- Videos
  for (const v of (MenuStore.videos || [])) {
    const title = v.titleHu || v.videoTitleHu || v.video_title_hu || v.title || "";
    const desc = v.descriptionHu || v.videoDescriptionHu || v.video_description_hu || v.description || "";

    const sTitle = scoreMatch(normalizeText(title), qNorm);
    const sDesc = scoreMatch(normalizeText(desc), qNorm) / 2;
    const s = Math.max(sTitle, sDesc);

    if (s > 0) {
      results.push({
        type: "VIDEO",
        id: Number(v.id ?? v.videoId ?? v.video_id),
        title: title || "(videó)",
        snippet: desc,
        score: s,
        meta: "Videó",
      });
    }
  }

  // -------- Documents
  for (const d of (MenuStore.documents || [])) {
    const title = d.titleHu || d.documentTitleHu || d.document_title_hu || d.title || "";
    const desc = d.descriptionHu || d.documentDescriptionHu || d.document_description_hu || d.description || "";

    const sTitle = scoreMatch(normalizeText(title), qNorm);
    const sDesc = scoreMatch(normalizeText(desc), qNorm) / 2;
    const s = Math.max(sTitle, sDesc);

    if (s > 0) {
      results.push({
        type: "DOCUMENT",
        id: Number(d.id ?? d.documentId ?? d.document_id),
        title: title || "(dokumentum)",
        snippet: desc,
        score: s,
        meta: "Dokumentum",
      });
    }
  }

  // -------- Glossary (ha betöltve)
  if (SearchStore.glossary?.isLoaded) {
    for (const g of (SearchStore.glossary.terms || [])) {
      const name = g.termNameHu || "";
      const short = g.shortHu || "";
      const def = g.definitionHu || "";
      const tags = g.tagsCsv || "";

      const sName = scoreMatch(normalizeText(name), qNorm);
      const sShort = scoreMatch(normalizeText(short), qNorm);
      const sDef = scoreMatch(normalizeText(def), qNorm) / 3;
      const sTags = scoreMatch(normalizeText(tags), qNorm) / 2;

      const best = Math.max(sName, sShort, sDef, sTags);
      if (best > 0) {
        results.push({
          type: "GLOSSARY_TERM",
          id: Number(g.id),
          title: name,
          snippet: short || def,
          score: best + (sName ? 10 : 0),
          meta: "Fogalom",
        });
      }
    }
  }

  // Sort + limit
  results.sort((a, b) => (b.score ?? 0) - (a.score ?? 0));
  return results.slice(0, 60);
}
