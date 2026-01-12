import SearchStore from "../store/search-store.js";
import MenuStore from "../store/menu-store.js";
import { renderSearchOverlay } from "../render/render-search-overlay.js";
import { runSearch } from "../utils/search-engine.js";
import { loadGlossaryBundle } from "../api/load-glossary-bundle.js";

let debounceTimer = null;
let lastRenderedQuery = "";
let lastSelStart = null;
let lastSelEnd = null;

function debounce(fn, ms) {
  clearTimeout(debounceTimer);
  debounceTimer = setTimeout(fn, ms);
}

export function openSearchOverlay() {
  SearchStore.ui.isOpen = true;
  SearchStore.ui.error = null;
  SearchStore.ui.mode = "results";
  SearchStore.ui.activeTopicId = null;
  SearchStore.ui.activeGlossaryId = null;

  // Lazy-load glossary (open-searchkor)
  if (!SearchStore.glossary.isLoaded && !SearchStore.ui.isLoadingGlossary) {
    loadGlossaryBundle().catch(err => {
      console.error(err);
      SearchStore.ui.error = "A szószedet betöltése nem sikerült.";
      SearchStore.ui.isLoadingGlossary = false;
      renderSearchOverlay(runSearch(SearchStore.ui.query));
    });
  }

  // Első render + focus
  renderSearchOverlay(runSearch(SearchStore.ui.query));

  requestAnimationFrame(() => {
    const input = document.querySelector("#search-overlay .search-overlay__input");
    if (input) {
      input.focus();
      // kurzor a végére
      try { input.setSelectionRange(input.value.length, input.value.length); } catch (_) {}
    }
  });
}

export function closeSearchOverlay() {
  SearchStore.ui.isOpen = false;
  SearchStore.ui.mode = "results";
  SearchStore.ui.activeTopicId = null;
  SearchStore.ui.activeGlossaryId = null;
  renderSearchOverlay([]);
}

function backToResults() {
  SearchStore.ui.mode = "results";
  SearchStore.ui.activeTopicId = null;
  SearchStore.ui.activeGlossaryId = null;
  renderSearchOverlay(runSearch(SearchStore.ui.query));
}

function navigateToSubtopic(subtopicId) {
  // Router kezeli
  window.location.hash = `#/lesson/${subtopicId}`;
  closeSearchOverlay();
}

function openTopicSubtopicList(topicId) {
  SearchStore.ui.mode = "topic";
  SearchStore.ui.activeTopicId = Number(topicId);
  renderSearchOverlay([]);
}

function openGlossaryDetails(glossaryId) {
  SearchStore.ui.mode = "glossary";
  SearchStore.ui.activeGlossaryId = Number(glossaryId);
  renderSearchOverlay([]);
}

function ensureVideoContextAndNavigate(videoId) {
  // Megpróbáljuk kitalálni a subtopicot a már betöltött relációkból
  // Ha nincs mapping, fallback: lesson nézet nélkül nem tudjuk ideálisan megnyitni.
  const vid = Number(videoId);
  const idx = MenuStore.index?.videosBySubtopic;
  let foundSubtopicId = null;

  if (idx && idx instanceof Map) {
    for (const [subId, vids] of idx.entries()) {
      if (Array.isArray(vids) && vids.some(v => Number(v.id) === vid)) {
        foundSubtopicId = subId;
        break;
      }
    }
  } else {
    // biztos ami biztos: brute force reláció (ha van)
    const rel = MenuStore.subtopicVideos || [];
    const row = rel.find(r => Number(r.videoId) === vid || Number(r.video_id) === vid);
    if (row) foundSubtopicId = Number(row.subtopicId ?? row.subtopic_id);
  }

  if (foundSubtopicId != null) {
    window.location.hash = `#/lesson/${foundSubtopicId}?video=${vid}`;
    closeSearchOverlay();
  } else {
    // TODO: ha később lesz önálló video route
    window.location.hash = "#/";
    closeSearchOverlay();
  }
}

function ensureDocumentContextAndNavigate(documentId) {
  const docId = Number(documentId);

  // Dokumentum → videó mapping (documentsByVideo)
  const idxDocByVideo = MenuStore.index?.documentsByVideo;
  let foundVideoId = null;
  if (idxDocByVideo && idxDocByVideo instanceof Map) {
    for (const [videoId, docs] of idxDocByVideo.entries()) {
      if (Array.isArray(docs) && docs.some(d => Number(d.id) === docId)) {
        foundVideoId = videoId;
        break;
      }
    }
  }

  if (foundVideoId != null) {
    ensureVideoContextAndNavigate(foundVideoId);
    return;
  }

  // Dokumentum → subtopic mapping
  const idxDocBySub = MenuStore.index?.documentsBySubtopic;
  let foundSubtopicId = null;
  if (idxDocBySub && idxDocBySub instanceof Map) {
    for (const [subId, docs] of idxDocBySub.entries()) {
      if (Array.isArray(docs) && docs.some(d => Number(d.id) === docId)) {
        foundSubtopicId = subId;
        break;
      }
    }
  }

  if (foundSubtopicId != null) {
    navigateToSubtopic(foundSubtopicId);
  } else {
    window.location.hash = "#/";
    closeSearchOverlay();
  }
}

function restoreInputFocus() {
  requestAnimationFrame(() => {
    if (!SearchStore.ui.isOpen) return;
    if (SearchStore.ui.mode !== "results") return;

    const input = document.querySelector("#search-overlay .search-overlay__input");
    if (!input) return;

    input.focus();

    // Cursor/selection visszaállítás (ha van)
    try {
      const len = input.value.length;
      const start = typeof lastSelStart === "number" ? Math.min(lastSelStart, len) : len;
      const end = typeof lastSelEnd === "number" ? Math.min(lastSelEnd, len) : len;
      input.setSelectionRange(start, end);
    } catch (_) {
      // noop
    }
  });
}

function onInput(inputEl) {
  const value = inputEl?.value ?? "";
  SearchStore.ui.query = value;

  // Mentjük az aktuális kurzor/selection pozíciót még a render ELŐTT
  try {
    lastSelStart = inputEl.selectionStart;
    lastSelEnd = inputEl.selectionEnd;
  } catch (_) {
    lastSelStart = null;
    lastSelEnd = null;
  }

  // csak results módban futtatunk keresést gépeléskor
  if (SearchStore.ui.mode !== "results") {
    SearchStore.ui.mode = "results";
    SearchStore.ui.activeTopicId = null;
    SearchStore.ui.activeGlossaryId = null;
  }

  debounce(() => {
    if (!SearchStore.ui.isOpen) return;
    if (SearchStore.ui.query === lastRenderedQuery) return;
    lastRenderedQuery = SearchStore.ui.query;
    renderSearchOverlay(runSearch(SearchStore.ui.query));
    restoreInputFocus();
  }, 200);
}

export function initSearchOverlayEvents() {
  // Keydown: ESC bezár
  document.addEventListener("keydown", (e) => {
    if (!SearchStore.ui.isOpen) return;
    if (e.key === "Escape") {
      e.preventDefault();
      closeSearchOverlay();
    }
  });

  // Overlay event delegation (click + input)
  document.addEventListener("click", (e) => {
    if (!SearchStore.ui.isOpen) return;

    const el = e.target.closest("[data-action]");
    if (!el) return;

    const action = el.dataset.action;

    switch (action) {
      case "search-close":
        closeSearchOverlay();
        break;

      case "search-back":
        backToResults();
        break;

      case "search-select": {
        const type = el.dataset.type;
        const id = el.dataset.id;

        if (type === "SUBTOPIC") {
          navigateToSubtopic(id);
        } else if (type === "TOPIC") {
          openTopicSubtopicList(id);
        } else if (type === "GLOSSARY_TERM") {
          openGlossaryDetails(id);
        } else if (type === "VIDEO") {
          ensureVideoContextAndNavigate(id);
        } else if (type === "DOCUMENT") {
          ensureDocumentContextAndNavigate(id);
        }
        break;
      }

      default:
        break;
    }
  });

  document.addEventListener("input", (e) => {
    if (!SearchStore.ui.isOpen) return;
    const input = e.target.closest("[data-action='search-input']");
    if (!input) return;
    onInput(input);
  });
}
