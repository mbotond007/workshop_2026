const UiTextStore = {
  // ui_key -> { hu, en }
  items: {},

  // később nyelvváltásnál ezt lehet centralizálni
  ui: {
    lang: "hu"
  },

  setAll(rows = []) {
    const map = {};
    for (const r of rows) {
      const key = String(r.ui_key ?? "").trim();
      if (!key) continue;
      map[key] = {
        hu: r.hu ?? "",
        en: r.en ?? ""
      };
    }
    this.items = map;
  },

  t(key, fallback = "") {
    const k = String(key ?? "");
    const row = this.items[k];
    if (!row) return fallback || k;

    const lang = this.ui.lang || "hu";
    const val = row[lang] ?? row.hu ?? row.en ?? "";
    return val || fallback || k;
  }
};

export default UiTextStore;
