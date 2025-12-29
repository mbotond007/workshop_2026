import MenuStore from '../store/menu-store.js';
import Video from '../models/video.js';

/**
 * Renders the lesson content for a given subtopic ID
 */
export function renderLesson(subtopicId) {
    const stage = document.getElementById('learning-stage');
    stage.innerHTML = '';

    // --- Subtopic ---
    const subtopic = MenuStore.subtopics.find(s => s.id === subtopicId);
    if (!subtopic) return;

    /* === LESSON CONTAINER === */
    const lesson = document.createElement('section');
    lesson.className = 'lesson';

    /* === HEADER === */
    const header = document.createElement('header');
    header.className = 'lesson__header';

    const title = document.createElement('h1');
    title.textContent = subtopic.name;

    header.appendChild(title);
    lesson.appendChild(header);

    /* === CONTENT === */
    const content = document.createElement('div');
    content.className = 'lesson__content';

    /* =======================
       VIDEOS SECTION
       ======================= */
    const videosSection = document.createElement('section');
    videosSection.className = 'lesson__section lesson__section--videos';

    const videosTitle = document.createElement('h2');
    videosTitle.textContent = 'Videók';
    videosSection.appendChild(videosTitle);

    const videoList = document.createElement('div');
    videoList.className = 'lesson__videos';

    const videoIds =
    MenuStore.index.videosBySubtopic?.[subtopicId] || [];

    // Video objektumok összegyűjtése
    const lessonVideos = videoIds
        .map(videoId => MenuStore.videos.find(v => Number(v.id) === Number(videoId)))
        .filter(Boolean);

    // Rendezés curriculum_order szerint
    lessonVideos.sort((a, b) => {
        const ao = a.curriculum_order ?? null;
        const bo = b.curriculum_order ?? null;

        // mindkettőnek van order → számsorrend
        if (ao !== null && bo !== null) return Number(ao) - Number(bo);

        // csak A-nak van → A előre
        if (ao !== null && bo === null) return -1;

        // csak B-nek van → B előre
        if (ao === null && bo !== null) return 1;

        // egyiknek sincs → stabil fallback (cím szerint)
        return String(a.title || '').localeCompare(String(b.title || ''), 'hu');
    });

    if (lessonVideos.length === 0) {
        const empty = document.createElement('p');
        empty.textContent = 'Ehhez a leckéhez nem tartozik videó.';
        videoList.appendChild(empty);
    } else {
        lessonVideos.forEach(videoData => {
            const videoId = Number(videoData.id);

            const video = new Video(videoData, {
                documents: MenuStore.index.documentsByVideo?.[videoId] || []
            });

            videoList.appendChild(video.renderCard());
        });
    }


    videosSection.appendChild(videoList);
    content.appendChild(videosSection);

/* =======================
   DOCUMENTS SECTION
   (lesson-level, UX-filtered)
   ======================= */

const docsSection = document.createElement('section');
docsSection.className = 'lesson__section lesson__section--documents';

const docsTitle = document.createElement('h2');
docsTitle.textContent = 'Tananyagok';
docsSection.appendChild(docsTitle);

/* 1️⃣ lesson videók */
const lessonVideoIds =
    MenuStore.index.videosBySubtopic?.[subtopicId] || [];

/* 2️⃣ összes video-dokumentum ID összegyűjtése */
const videoDocumentIdSet = new Set();

lessonVideoIds.forEach(videoId => {
    const videoDocs =
        MenuStore.index.documentsByVideo?.[videoId] || [];
    videoDocs.forEach(docId => videoDocumentIdSet.add(Number(docId)));
});

/* 3️⃣ lesson dokumentumok (eredeti kapcsolatok) */
const lessonDocIds =
    MenuStore.index.documentsBySubtopic?.[subtopicId] || [];

/* 4️⃣ UX-szintű szűrés */
const filteredLessonDocIds = lessonDocIds.filter(
    docId => !videoDocumentIdSet.has(Number(docId))
);

/* 5️⃣ render */
if (filteredLessonDocIds.length === 0) {
    const empty = document.createElement('p');
    empty.textContent = 'Ehhez a leckéhez nincs külön tananyag.';
    docsSection.appendChild(empty);
} else {
    const list = document.createElement('ul');
    list.className = 'lesson__documents';

    filteredLessonDocIds.forEach(docId => {
        const doc = MenuStore.documents.find(
            d => Number(d.id) === Number(docId)
        );
        if (!doc) return;

        list.appendChild(renderDocumentItem(doc));
    });

    docsSection.appendChild(list);
}

content.appendChild(docsSection);


    /* === FINAL ASSEMBLY === */
    lesson.appendChild(content);
    stage.appendChild(lesson);
}

/* =======================
   Helpers
   ======================= */
function renderDocumentItem(doc) {
    const li = document.createElement('li');
    li.className = 'document-item';

    const link = document.createElement('a');
    link.href = doc.url || doc.path;
    link.target = '_blank';
    link.rel = 'noopener';
    link.textContent = doc.title || `Dokumentum #${doc.id}`;

    li.appendChild(link);
    return li;
}

export function renderDirectTopic(topicId) {
  const stage = document.getElementById("learning-stage");
  stage.innerHTML = "";

  const topic = MenuStore.topics.find(t => t.id === topicId);

  const section = document.createElement("section");
  section.className = "lesson";

  const header = document.createElement("header");
  header.className = "lesson__header";

  const title = document.createElement("h1");
  title.textContent = topic?.name || `Topic #${topicId}`;

  header.appendChild(title);
  section.appendChild(header);

  const docsSection = document.createElement("section");
  docsSection.className = "lesson__section lesson__section--documents";

  const docsTitle = document.createElement("h2");
  docsTitle.textContent = "Tananyagok";
  docsSection.appendChild(docsTitle);

  const docIds = MenuStore.index.documentsByTopic?.[topicId] || [];

  if (docIds.length === 0) {
    const empty = document.createElement("p");
    empty.textContent = "Ehhez a témához nincs külön tananyag.";
    docsSection.appendChild(empty);
  } else {
    const ul = document.createElement("ul");
    ul.className = "document-list";

    docIds.forEach(docId => {
      const doc = MenuStore.documents.find(d => d.id === Number(docId));
      if (doc) ul.appendChild(renderDocumentItem(doc));
    });

    docsSection.appendChild(ul);
  }

  section.appendChild(docsSection);
  stage.appendChild(section);
}
