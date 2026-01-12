import SearchStore from "../store/search-store.js";

export async function loadGlossaryBundle() {
  if (SearchStore.glossary.isLoaded) return;

  SearchStore.ui.isLoadingGlossary = true;
  SearchStore.ui.error = null;

  const response = await fetch("modules/api/load-glossary-bundle.php", { method: "POST" });

  if (!response.ok) {
    SearchStore.ui.isLoadingGlossary = false;
    throw new Error(`loadGlossaryBundle failed: HTTP ${response.status}`);
  }

  const json = await response.json();

  if (!json.success) {
    SearchStore.ui.isLoadingGlossary = false;
    throw new Error(json.error || "loadGlossaryBundle failed");
  }

  const data = json.data || {};
  const glossary = Array.isArray(data.glossary) ? data.glossary : [];
  const rel = Array.isArray(data.topicGlossary) ? data.topicGlossary : [];

  SearchStore.glossary.terms = glossary.map(row => ({
    id: Number(row.glossary_id),
    termNameHu: row.term_name_hu,
    definitionHu: row.term_definition_hu,
    shortHu: row.short_hu,
    tagsCsv: row.tags
  }));

  SearchStore.glossary.topicGlossary = rel.map(row => ({
    topicId: Number(row.topic_id),
    glossaryId: Number(row.glossary_id)
  }));

  SearchStore.glossary.isLoaded = true;
  SearchStore.ui.isLoadingGlossary = false;
  SearchStore.buildGlossaryIndexes();
}
