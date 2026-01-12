// assets/js/ui/router.js
import { openSubtopic } from "../render/render-category-bar.js";
import MenuStore from "../store/menu-store.js";

export function initRouter() {
  window.addEventListener("hashchange", handleRoute);
  handleRoute(); // első betöltésnél is
}

function handleRoute() {
  const h = window.location.hash || "";

  // #/lesson/12 vagy #/lesson/12?video=24
  const mLesson = h.match(/^#\/lesson\/(\d+)(\?.*)?$/);
  if (mLesson) {
    const subtopicId = Number(mLesson[1]);
    const query = mLesson[2] || "";
    const params = new URLSearchParams(query.startsWith("?") ? query.slice(1) : "");

    openSubtopic(subtopicId);

    const videoParam = params.get("video");
    if (videoParam) {
      const videoId = Number(videoParam);
      openVideoInCurrentLesson(videoId);
    }

    const docParam = params.get("doc");
    if (docParam) {
      const docId = Number(docParam);
      focusDocumentInCurrentLesson(subtopicId, docId);
    }

    return;
  }

  // (a #/video/:id route-ot később tesszük hozzá)
}

function openVideoInCurrentLesson(videoId) {
  // render után keressük meg a videókártyát
  requestAnimationFrame(() => {
    requestAnimationFrame(() => {
      const card = document.querySelector(`.video-card[data-video-id="${videoId}"]`);
      if (!card) {
        console.warn("Video deep link: video not found in this lesson:", videoId);
        return;
      }

      card.scrollIntoView({ behavior: "smooth", block: "center" });
      card.click();
    });
  });
}



console.log("Router initialized");

function focusDocumentInCurrentLesson(subtopicId, docId) {
  // Várjuk meg a lesson render végét
  requestAnimationFrame(() => {
    requestAnimationFrame(() => {
      const tryFocus = () => {
        const el = document.querySelector(`[data-doc-id="${docId}"]`);
        if (el) {
          el.scrollIntoView({ behavior: "smooth", block: "center" });
          el.classList.add("is-flash");
          window.setTimeout(() => el.classList.remove("is-flash"), 1200);
          return true;
        }
        return false;
      };

      if (tryFocus()) return;

      // Ha nincs a DOM-ban, lehet video-doksi: nyissuk meg azt a videót, amelyikhez tartozik
      const lessonVideoIds = MenuStore.index?.videosBySubtopic?.[subtopicId] || [];
      let foundVideoId = null;
      for (const vid of lessonVideoIds) {
        const docIds = MenuStore.index?.documentsByVideo?.[vid] || [];
        if (docIds.map(Number).includes(Number(docId))) {
          foundVideoId = Number(vid);
          break;
        }
      }

      if (foundVideoId) {
        openVideoInCurrentLesson(foundVideoId);
        // újra próbáljuk a fókuszt a videó megnyitása után
        window.setTimeout(() => {
          if (!tryFocus()) {
            console.warn("Doc deep link: doc element not found after opening video:", docId);
          }
        }, 250);
      } else {
        console.warn("Doc deep link: doc not found in lesson DOM or video mappings:", docId);
      }
    });
  });
}
