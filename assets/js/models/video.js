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

    /* ---------- UI actions ---------- */

    open() {
        this.isOpen = true;
        this.renderDetails();
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
        docsHint.textContent = `📎 Kapcsolódó anyag (${docCount})`;

        // ugyanazt csinálja, mint a kártya megnyitása
        docsHint.onclick = (e) => {
            e.stopPropagation();
            this.open();
        };

        card.appendChild(docsHint);
    }

    /* --- kártya kattintás → details --- */
    card.onclick = () => this.open();

    return card;
}


/* old code

    renderCard() {
        const card = document.createElement('div');
        card.className = 'video-card';

        card.innerHTML = `
            <div class="video-card__thumb">
                <span class="video-card__icon">🎥</span>
            </div>
            <div class="video-card__content">
                <h3 class="video-card__title">${this.title}</h3>
                <div class="video-card__meta">
                 ⏱ ${formatDuration(this.duration)}
                </div>

            </div>
        `;

        card.onclick = () => this.toggle();
        return card;
    }
*/
renderDetails() {

    console.log('VIDEO DOC IDS:', this.documents);

    let panel = document.getElementById('video-details-panel');

    if (!panel) {
        panel = document.createElement('div');
        panel.id = 'video-details-panel';
        panel.className = 'video-details';
        document.getElementById('learning-stage').appendChild(panel);
    }

    /* --- alap struktúra --- */
    panel.innerHTML = `
        <button class="video-details__close">✕</button>

        <div class="video-details__content">
            <h2>${this.title}</h2>
            <p>${this.description || ''}</p>

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
        </div>
    `;

    /* --- dokumentumok feltöltése --- */
    const docIds = this.documents || [];
    const list = panel.querySelector('.video-details__documents-list');
    const docsSection = panel.querySelector('.video-details__documents');

    if (docIds.length > 0 && MenuStore.documents) {

        docIds.forEach(docId => {
            const doc = MenuStore.documents.find(
                d => Number(d.id) === Number(docId)
            );
            if (!doc) return;

            const li = document.createElement('li');
            const a = document.createElement('a');

            a.href = doc.url || doc.path;
            a.target = '_blank';
            a.rel = 'noopener';
            a.textContent = doc.title;

            li.appendChild(a);
            list.appendChild(li);
        });

    } else {
        // ha nincs dokumentum, a szekciót elrejthetjük
        docsSection.style.display = 'none';
    }

    /* --- bezárás --- */
    panel.querySelector('.video-details__close').onclick = () => this.close();
}



    removeDetails() {
        const panel = document.getElementById('video-details-panel');
        if (panel) panel.remove();
    }
}
