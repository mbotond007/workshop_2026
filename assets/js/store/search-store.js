/**
 * SearchStore
 * - Külön store (nem MenuStore), mert a glossary lazy-load és nem kell
 *   az app indulásakor.
 * - Minimális, "hardcode-olható" állapotmezők.
 */

const SearchStore = {
  ui: {
    isOpen: false,
    query: "",
    minChars: 3,
    mode: "results", // "results" | "topic" | "glossary"
    activeTopicId: null,
    activeGlossaryId: null,
    isLoadingGlossary: false,
    error: null,
  },

  // Cache - egyszer töltjük be (open-searchkor)
  glossary: {
    isLoaded: false,
    terms: [], // { id, termNameHu, shortHu, definitionHu, tagsCsv }
    topicGlossary: [], // { topicId, glossaryId }
    index: {
      glossaryById: new Map(),
      glossaryIdsByTopicId: new Map(),
      topicIdsByGlossaryId: new Map(),
    },
  },

  buildGlossaryIndexes() {
    const g = this.glossary;
    g.index.glossaryById = new Map();
    g.index.glossaryIdsByTopicId = new Map();
    g.index.topicIdsByGlossaryId = new Map();

    for (const t of g.terms) {
      g.index.glossaryById.set(Number(t.id), t);
    }

    for (const row of g.topicGlossary) {
      const topicId = Number(row.topicId);
      const glossaryId = Number(row.glossaryId);

      if (!g.index.glossaryIdsByTopicId.has(topicId)) {
        g.index.glossaryIdsByTopicId.set(topicId, []);
      }
      g.index.glossaryIdsByTopicId.get(topicId).push(glossaryId);

      if (!g.index.topicIdsByGlossaryId.has(glossaryId)) {
        g.index.topicIdsByGlossaryId.set(glossaryId, []);
      }
      g.index.topicIdsByGlossaryId.get(glossaryId).push(topicId);
    }
  },
};

export default SearchStore;
