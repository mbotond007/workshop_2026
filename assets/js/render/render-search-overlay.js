import MenuStore from "../store/menu-store.js";
import SearchStore from "../store/search-store.js";

function ensureHost() {
  let host = document.getElementById("search-overlay");
  if (!host) {
    host = document.createElement("div");
    host.id = "search-overlay";
    document.body.appendChild(host);
  }
  return host;
}

function renderHeader(query) {
  return `
    <div class="search-overlay__top">
      <div class="search-overlay__input-row">
        <input type="search" class="search-overlay__input" placeholder="Keresés..." value="${escapeHtml(query)}" data-action="search-input" />
        <button type="button" class="search-overlay__close" data-action="search-close" aria-label="Bezárás">×</button>
      </div>
    </div>
  `;
}

function escapeHtml(s) {
  return String(s ?? "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/\"/g, "&quot;")
    .replace(/'/g, "&#39;");
}

function highlightEscapedHtml(escapedText, query) {
  if (!escapedText || !query || query.length < 3) return escapedText;

  // regex escape
  const q = query.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  const re = new RegExp(`(${q})`, "gi");

  // escapedText már safe, ebbe tesszük bele a saját spanünket
  return escapedText.replace(re, '<span class="search-highlight">$1</span>');
}


function renderEmptyState(minChars) {
  return `
    <div class="search-overlay__empty">
      <p>Írj be legalább <strong>${minChars}</strong> karaktert.</p>
      <p class="search-overlay__hint">Kereshetsz leckére, videóra, dokumentumra vagy fogalomra.</p>
    </div>
  `;
}

function renderLoadingGlossary() {
  return `
    <div class="search-overlay__loading">
      Szószedet betöltése...
    </div>
  `;
}

function renderResultsList(results, query) {
  if (!results.length) {
    return `
      <div class="search-overlay__empty">
        <p>Nincs találat.</p>
      </div>
    `;
  }

  const rows = results.map(r => {
    const snippet = r.snippet
    ? `<div class="search-overlay__snippet">${highlightEscapedHtml(escapeHtml(r.snippet), query)}</div>`
    : "";

    return `
      <li class="search-overlay__item" data-action="search-select" data-type="${r.type}" data-id="${r.id}">
        <span class="search-overlay__badge badge--${r.type}">${labelForType(r.type)}</span>
        <div class="search-overlay__text">
          <div class="search-overlay__title">${highlightEscapedHtml(escapeHtml(r.title), query)}</div>
          ${snippet}
        </div>
      </li>
    `;
  }).join("");

  return `<ul class="search-overlay__list">${rows}</ul>`;
}

function labelForType(type) {
  switch (type) {
    case "TOPIC": return "TÉMA";
    case "SUBTOPIC": return "LECKE";
    case "VIDEO": return "VIDEÓ";
    case "DOCUMENT": return "DOKSI";
    case "GLOSSARY_TERM": return "FOGALOM";
    default: return type;
  }
}

function renderTopicView(topicId, query) {
  const topic = (MenuStore.topics || []).find(t => Number(t.id) === Number(topicId));
  const title = topic?.name || "Téma";

  const subs = (MenuStore.subtopics || []).filter(s => Number(s.topicId) === Number(topicId));
  const rows = subs
    .sort((a, b) => (a.sortOrder ?? 0) - (b.sortOrder ?? 0))
    .map(s => `
      <li class="search-overlay__item" data-action="search-select" data-type="SUBTOPIC" data-id="${s.id}">
        <span class="search-overlay__badge badge--SUBTOPIC">LECKE</span>
        <div class="search-overlay__text">
        <div class="search-overlay__title">${highlightEscapedHtml(escapeHtml(s.name), query)}</div>
        </div>
      </li>
    `).join("");

  return `
    <div class="search-overlay__subheader">
      <button type="button" class="search-overlay__back" data-action="search-back">← Vissza</button>
      <div class="search-overlay__context">${escapeHtml(title)} — leckék</div>
    </div>
    <ul class="search-overlay__list">${rows || `<li class="search-overlay__empty">Nincs lecke.</li>`}</ul>
  `;
}

function renderGlossaryView(glossaryId) {
  const term = SearchStore.glossary.index.glossaryById.get(Number(glossaryId));
  if (!term) {
    return `
      <div class="search-overlay__empty">
        <button type="button" class="search-overlay__back" data-action="search-back">← Vissza</button>
        <p>Nem található fogalom.</p>
      </div>
    `;
  }

  const relatedTopicIds = SearchStore.glossary.index.topicIdsByGlossaryId.get(Number(glossaryId)) || [];
  const relatedTopics = relatedTopicIds
    .map(id => (MenuStore.topics || []).find(t => Number(t.id) === Number(id)))
    .filter(Boolean)
    .sort((a, b) => (a.sortOrder ?? 0) - (b.sortOrder ?? 0));

  const topicButtons = relatedTopics.map(t => `
    <button type="button" class="search-overlay__pill" data-action="search-select" data-type="TOPIC" data-id="${t.id}">
      ${escapeHtml(t.name)}
    </button>
  `).join("");

  return `
    <div class="search-overlay__subheader">
      <button type="button" class="search-overlay__back" data-action="search-back">← Vissza</button>
      <div class="search-overlay__context">Fogalom</div>
    </div>

    <div class="search-overlay__glossary">
      <h3 class="search-overlay__glossary-title">${escapeHtml(term.termNameHu)}</h3>
      ${term.shortHu ? `<p class="search-overlay__glossary-short">${escapeHtml(term.shortHu)}</p>` : ""}
      ${term.definitionHu ? `<div class="search-overlay__glossary-def">${escapeHtml(term.definitionHu)}</div>` : ""}

      <div class="search-overlay__glossary-related">
        <div class="search-overlay__section-title">Kapcsolódó témák</div>
        <div class="search-overlay__pills">${topicButtons || `<span class="search-overlay__muted">Nincs kapcsolódó téma.</span>`}</div>
      </div>
    </div>
  `;
}

export function renderSearchOverlay(results = []) {
  const host = ensureHost();

  if (!SearchStore.ui.isOpen) {
    host.innerHTML = "";
    host.className = "";
    return;
  }

  host.className = "search-overlay";

  const minChars = SearchStore.ui.minChars || 3;
  const query = SearchStore.ui.query || "";

  let bodyHtml = "";

  if (SearchStore.ui.mode === "topic" && SearchStore.ui.activeTopicId) {
    bodyHtml = renderTopicView(SearchStore.ui.activeTopicId, query);
  } else if (SearchStore.ui.mode === "glossary" && SearchStore.ui.activeGlossaryId) {
    bodyHtml = renderGlossaryView(SearchStore.ui.activeGlossaryId);
  } else {
    if (normalizeQuery(query).length < minChars) {
      bodyHtml = renderEmptyState(minChars);
    } else {
      bodyHtml = renderResultsList(results, query);
    }

    if (SearchStore.ui.isLoadingGlossary) {
      bodyHtml += renderLoadingGlossary();
    }
  }

  host.innerHTML = `
    <div class="search-overlay__backdrop" data-action="search-close"></div>
    <div class="search-overlay__panel" role="dialog" aria-modal="true" aria-label="Keresés">
      ${renderHeader(query)}
      <div class="search-overlay__body">
        ${bodyHtml}
      </div>
    </div>
  `;
}

function normalizeQuery(q) {
  return String(q || "").trim();
}
