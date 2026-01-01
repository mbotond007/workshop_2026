export function initSiteHeaderEvents() {
  const host = document.querySelector(".site-header");
  if (!host) return;

  host.addEventListener("click", (e) => {
    const el = e.target.closest("[data-action]");
    if (!el) return;

    const action = el.dataset.action;

    switch (action) {
      case "go-home":
        // Most még “soft”: hash home.
        // A "komoly refresh" (hard reset) a 2. lépésedben jön.
        window.location.hash = "#/";
        break;

      case "open-sitemap":
        console.log("TODO: open-sitemap");
        break;

      case "open-search":
        console.log("TODO: open-search");
        break;

      case "open-contact":
        console.log("TODO: open-contact");
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
