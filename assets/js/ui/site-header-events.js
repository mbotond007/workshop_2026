import ContactModal from "./contact-modal.js";

export function initSiteHeaderEvents() {
  const host = document.querySelector(".site-header");
  if (!host) return;

  host.addEventListener("click", (e) => {
    const el = e.target.closest("[data-action]");
    if (!el) return;

    const action = el.dataset.action;

    switch (action) {
      case "go-home":
        e.preventDefault();
        // Hard reset a teszteléshez: teljes oldal újratöltés az index.php-ra.
        // Relatív útvonal-robosztus: megtartja a jelenlegi mappa-szintet.
        // Példa: /foo/index.php#/lesson/12 -> /foo/index.php
        {
          const basePath = window.location.pathname.replace(/\/[^/]*$/, "/");
          window.location.href = basePath + "index.php";
        }
        break;

      case "open-sitemap":
        console.log("TODO: open-sitemap");
        break;

      case "open-search":
        // Headerben a keresőmező csak trigger; a tényleges keresés overlayben.
        // Lazy import: ne terhelje az app init-et, ha nem használják.
        import("./search-overlay.js").then(({ openSearchOverlay }) => {
          openSearchOverlay();
        }).catch(err => {
          console.error("open-search failed", err);
        });
        break;

      // a delegált click switch-ben:
      case "open-contact":
        ContactModal.open();
        break;

      case "contact-submit":
        ContactModal.submit();
        break;

      case "modal-close":
        ContactModal.close();
        break;

      case "open-login":
        console.log("TODO: open-login");
        break;

      case "open-register":
        console.log("TODO: open-register");
        break;

      case "logout":
        console.log("TODO: logout");
        break;

      default:
        console.warn("Unknown header action:", action);
    }
  });
}
