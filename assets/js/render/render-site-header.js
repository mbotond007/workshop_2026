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
  const host = document.querySelector(".site-header");
  if (!host) return;

  const inside = host.querySelector(".site-header__inside");
  if (!inside) {
    console.warn("renderSiteHeader: .site-header__inside not found");
    return;
  }

  // Render előtt ürítjük (a header teljesen DB-vezérelt)
  inside.innerHTML = "";

  const items = Array.isArray(MenuStore.headerMenu) ? MenuStore.headerMenu : [];

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
