import MenuStore from '../store/menu-store.js';
import { formatDuration } from '../utils/format-duration.js';

export default class Video {
    constructor(videoData, relations = {}) {
        // --- raw data ---
        this.id = videoData.id;
        this.title = videoData.title;
        this.description = videoData.description || '';
        this.duration = videoData.duration || null;
        this.youtubeId = videoData.youtubeId;
        this.publishedAt = videoData.publishedAt || null;

        // --- relations ---
        this.subtopics = relations.subtopics || [];
        this.documents = relations.documents || [];
        this.order = relations.order || null;

        // --- UI state ---
        this.isOpen = false;
    }

    // --- static UI state ---
    static openCardEl = null;
    static openVideoInstance = null;


    /* ---------- UI actions ---------- */

    open(cardEl) {

    // debugging    
    console.count("video open");
        
    // zárd a korábban nyitottat, ha másik
    if (Video.openCardEl && Video.openCardEl !== cardEl && Video.openVideoInstance) {
        Video.openVideoInstance.close();
    }

    this.isOpen = true;
    this.renderDetailsInCard(cardEl);

    Video.openCardEl = cardEl;
    Video.openVideoInstance = this;
    }


    close() {
        this.isOpen = false;
        this.removeDetails();
    }

    toggle() {
        this.isOpen ? this.close() : this.open();
    }

    /* ---------- Rendering ---------- */
    get formattedDuration() {
        return formatDuration(this.duration);
    }
    
    
    renderCard() {

    const icon = document.createElement('span');
    icon.className = 'video-card__icon';
    icon.textContent = '🎥';

    const card = document.createElement('div');
    card.className = 'video-card';
    card.dataset.videoId = String(this.id);


    /* --- fő tartalom --- */
    const title = document.createElement('h3');
    title.className = 'video-card__title';
    title.textContent = this.title;

    const meta = document.createElement('div');
    meta.className = 'video-card__meta';

    if (this.duration) {
        meta.textContent = `⏱ ${this.formattedDuration || ''}`;
    }

    card.appendChild(icon);
    card.appendChild(title);
    card.appendChild(meta);

    /* --- kapcsolódó anyag jelzés --- */
    const docCount = Array.isArray(this.documents)
        ? this.documents.length
        : 0;

    if (docCount > 0) {
        const docsHint = document.createElement('div');
        docsHint.className = 'video-card__documents-hint';
        docsHint.textContent = `📎 Van kapcsolódó diasor (${docCount} db)`;

        // ugyanazt csinálja, mint a kártya megnyitása
        docsHint.onclick = (e) => {
            e.stopPropagation();
            this.open(card);
        };

        card.appendChild(docsHint);
    }

    //--- adat attribútumok ---//
    card.dataset.videoId = String(this.id);

    /* --- kártya kattintás → details --- */
    card.onclick = () => {
    if (card.classList.contains("video-card--open")) return;
    this.open(card);
    };


    return card;
}


renderDetailsInCard(card) {
  // mentsd el az eredeti kártya UI-t (egyszer)
  if (!card.dataset.originalHtml) {
    card.dataset.originalHtml = card.innerHTML;
  }

  card.classList.add('video-card--open');

  card.innerHTML = `
    <div class="video-details__top">
        <div class="video-details__title">${this.title}</div>
        <div class="video-details__actions">
        <button type="button" class="video-details__copy-link" title="Videó link másolása">🔗</button>
        <button type="button" class="video-details__close">✕</button>
        </div>
    </div>

    <div class="video-details__player">
      <iframe
        src="https://www.youtube.com/embed/${this.youtubeId}"
        frameborder="0"
        allowfullscreen
      ></iframe>
    </div>

    <section class="video-details__documents">
      <h3>Kapcsolódó anyagok</h3>
      <ul class="video-details__documents-list"></ul>
    </section>
  `;

  // dokumentumok feltöltése
    const docIds = this.documents || [];
    const list = card.querySelector('.video-details__documents-list');
    const docsSection = card.querySelector('.video-details__documents');

    if (docIds.length > 0 && MenuStore.documents) {
        docIds.forEach(docId => {
        const doc = MenuStore.documents.find(d => Number(d.id) === Number(docId));
        if (!doc) return;

        const li = document.createElement('li');
        li.className = "document-item";
        
        const a = document.createElement('a');

        a.href = doc.url || doc.path;
        a.target = '_blank';
        a.rel = 'noopener';
        a.textContent = doc.title;
        


        li.appendChild(a);
        list.appendChild(li);
        });
        } else {
            docsSection.style.display = 'none';
        }

    // X gomb
    card.querySelector('.video-details__close').onclick = (e) => {
        e.stopPropagation();
        this.close();
    };

    // Link másolás
    card.querySelector(".video-details__copy-link").onclick = async (e) => {
    e.stopPropagation();
    await copyVideoDeepLink(this.id);
    };


    card.scrollIntoView({ behavior: "smooth", block: "center" });

    }

    close() {
    this.isOpen = false;

    if (Video.openCardEl && Video.openCardEl.dataset.originalHtml) {
        Video.openCardEl.innerHTML = Video.openCardEl.dataset.originalHtml;
        Video.openCardEl.classList.remove('video-card--open');
    }

    Video.openCardEl = null;
    Video.openVideoInstance = null;
    }


}

// Helper to get current subtopicId from URL hash

function getCurrentSubtopicIdFromHash() {
  const h = window.location.hash || "";
  const m = h.match(/^#\/lesson\/(\d+)/);
  return m ? Number(m[1]) : null;
}

async function copyVideoDeepLink(videoId) {
  const subtopicId = getCurrentSubtopicIdFromHash();

  if (!subtopicId) {
    console.warn("Link másolás: nem lesson nézetben vagy (#/lesson/:id hiányzik).");
    return;
  }

  const url =
    window.location.origin +
    window.location.pathname +
    `#/lesson/${subtopicId}?video=${videoId}`;

  try {
    await navigator.clipboard.writeText(url);
    console.log("Videó link vágólapra másolva:", url);
  } catch (err) {
    // fallback: működik akkor is, ha clipboard tiltott
    window.prompt("Másold ki ezt a linket:", url);
  }
}
