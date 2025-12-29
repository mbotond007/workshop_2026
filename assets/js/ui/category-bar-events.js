// assets/js/ui/category-bar-events.js
import { openSubtopic } from "../render/render-category-bar.js";

import { renderDirectTopic } from "../render/render-lesson.js";


function hideHero() {
  document.querySelector(".hero")?.classList.add("is-hidden");
}

function closeAllCategoryPanels(root) {
  root.querySelectorAll(".category-bar__panel")
      .forEach(p => p.classList.add("is-collapsed"));

  root.querySelectorAll(".category-bar__category-btn")
      .forEach(b => {
        b.setAttribute("aria-expanded", "false");
        b.classList.remove("is-active");
      });
}


export function initCategoryBarEvents() {
  const root = document.getElementById("category-bar__list");          // a gombok UL-je
  const bar  = document.querySelector(".category-bar__inside");         // a teljes sáv + panel host
  if (!root || !bar) return;

  // ✅ outside click: EGYSZER!
  document.addEventListener("click", (e) => {
    if (!bar.contains(e.target)) closeAllCategoryPanels(bar);
  });

    bar.addEventListener("click", (e) => {
    const el = e.target.closest("[data-action]");
    if (!el) return;

    const action = el.dataset.action;

    if (action === "toggle-category") {
        hideHero();
        toggleCategory({ root, panelHost: bar, categoryId: el.dataset.categoryId, btnEl: el });
        return;
    }

    if (action === "toggle-topic") {
        toggleTopic(el.dataset.topicId, bar); // (lásd lent)
        return;
    }

    if (action === "open-direct-topic") {
    closeAllCategoryPanels(bar);
    hideHero();

    const topicId = Number(el.dataset.topicId);
    renderDirectTopic(topicId);
    return;
    }


    if (action === "open-subtopic") {
        closeAllCategoryPanels(bar);
        hideHero();
        e.preventDefault();
        const subtopicId = el.dataset.subtopicId;
        window.location.hash = `#/lesson/${subtopicId}`;
        openSubtopic(subtopicId);
        return;
    }
    });

}

function toggleCategory({ root, panelHost, categoryId, btnEl }) {
  // reset mindent (expanded + highlight)
  panelHost.querySelectorAll(".category-bar__panel")
    .forEach(p => p.classList.add("is-collapsed"));

  root.querySelectorAll(".category-bar__category-btn")
    .forEach(b => {
      b.setAttribute("aria-expanded", "false");
      b.classList.remove("is-active");
    });

  // a panel MOST már lehet panelHost alatt (category-bar__inside)
  const panel = panelHost.querySelector(`[data-category-panel="${categoryId}"]`);
  if (!panel) return;

  panel.classList.remove("is-collapsed");
  btnEl.setAttribute("aria-expanded", "true");
  btnEl.classList.add("is-active");
}


function toggleTopic(topicId) {
  const panel = document.querySelector(`[data-subtopic-panel="${topicId}"]`);
  const btn = document.querySelector(
    `[data-action="toggle-topic"][data-topic-id="${topicId}"]`
  );

  if (!panel || !btn) {
    console.warn("toggleTopic: missing panel or btn", { topicId, panel, btn });
    return;
  }

  const isCollapsed = panel.classList.contains("is-collapsed");

  if (isCollapsed) {
    panel.classList.remove("is-collapsed");
    btn.setAttribute("aria-expanded", "true");
  } else {
    panel.classList.add("is-collapsed");
    btn.setAttribute("aria-expanded", "false");
  }
}


console.log("Category bar events initialized");