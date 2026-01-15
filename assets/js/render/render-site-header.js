// a konténer elemek feltöltéséhez szükséges UI szövegek betöltése
import UiTextStore from "../store/ui-text-store.js";

import MenuStore from "../store/menu-store.js";


/**
 * Nyelv kiválasztás: most HU fix.
 * Később ebből lehet language setting (MenuStore.ui.lang).
 */
function getLabel(item) {
  return item.nameHu || item.nameEn || item.action;
}

/**
 * Logó asset: nálad a nameHu/nameEn mezőben most fájlnév van (logo2.svg).
 * Ha később szöveges logó lesz, itt lehet elágaztatni.
 */
function getLogoSrc(item) {
  
  const fileName = item.nameHu || item.nameEn;
  return `./assets/images/${fileName}`;
}

export function renderSiteHeader() {
  const __headerMenu = (MenuStore.headerMenu || []).filter(it => Number(it.isReady ?? it.is_ready ?? 1) !== 0);

  const host = document.querySelector(".site-header");
  if (!host) return;

  const inside = host.querySelector(".site-header__inside");
  if (!inside) {
    console.warn("renderSiteHeader: .site-header__inside not found");
    return;
  }

  // Render előtt ürítjük (a header teljesen DB-vezérelt)
  inside.innerHTML = "";

  const items = Array.isArray(__headerMenu) ? __headerMenu : [];

  // Csak biztos ami biztos: sorrend
  const sorted = [...items].sort((a, b) => (a.sortOrder ?? 0) - (b.sortOrder ?? 0));

  // --- LOGO (action: go-home) ---
  const logoItem = sorted.find(x => x.action === "go-home");
  if (logoItem) {
    const a = document.createElement("a");
    a.href = "#/";
    a.className = "site-header__logo";
    a.dataset.action = "go-home";

    const img = document.createElement("img");
    img.src = getLogoSrc(logoItem);
    img.alt = "Főoldal";
    img.className = "site-header__logo-img";

    a.appendChild(img);
    inside.appendChild(a);
  }

  // --- NAV gombok ---
  const nav = document.createElement("nav");
  nav.className = "site-header__nav";

  sorted
    .filter(x => x.action !== "go-home")
    .forEach(item => {
      // A keresés legyen "input jellegű" trigger a headerben (GenZ/GenA: inkább mező, mint felirat).
      // Fontos: a tényleges keresés az overlayben történik, ez csak megnyitja azt.
      
    if (item.action === "open-search") {
    const wrap = document.createElement("div");
    wrap.className = "site-header__search";

    const input = document.createElement("input");
    input.type = "search";
    input.className = "site-header__search-input site-header__search-input--joined";

    input.placeholder = UiTextStore.t("header.search.placeholder", "Keresés…");
    input.setAttribute("aria-label", UiTextStore.t("header.search.aria", "Keresés"));
    input.readOnly = true;
    input.dataset.action = "open-search";

    const iconBtn = document.createElement("div");
    iconBtn.className = "site-header__search-btn";
    iconBtn.dataset.action = "open-search";
    iconBtn.setAttribute("aria-hidden", "true");
    iconBtn.innerHTML = `
      <svg viewBox="0 0 24 24" width="24" height="24">
        <path d="M10 4a6 6 0 104.472 10.03l4.249 4.249a1 1 0 001.414-1.414l-4.249-4.249A6 6 0 0010 4zm0 2a4 4 0 110 8 4 4 0 010-8z"></path>
      </svg>
    `;

    wrap.appendChild(input);
    wrap.appendChild(iconBtn);
    nav.appendChild(wrap);
    return;
  }



      const btn = document.createElement("button");
      btn.type = "button";

      // Egységes class + action modifier (később jól jön)
      btn.className = `site-header__btn header-button site-header__btn--${item.action}`;

      btn.dataset.action = item.action;
      btn.textContent = getLabel(item);

      nav.appendChild(btn);
    });

  inside.appendChild(nav);
}
