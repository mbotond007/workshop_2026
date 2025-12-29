// assets/js/ui/router.js
import { openSubtopic } from "../render/render-category-bar.js";

export function initRouter() {
  window.addEventListener("hashchange", handleRoute);
  handleRoute(); // első betöltésnél is
}

function handleRoute() {
  const h = window.location.hash || "";
  const m = h.match(/^#\/lesson\/(\d+)$/);
  if (m) {
    openSubtopic(m[1]);
  }
}

console.log("Router initialized");