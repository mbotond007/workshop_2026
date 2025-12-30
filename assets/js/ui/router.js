// assets/js/ui/router.js
import { openSubtopic } from "../render/render-category-bar.js";

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