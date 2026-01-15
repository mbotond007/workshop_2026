import MenuStore from './store/menu-store.js';

import { loadUiText } from "./api/load-ui-text.js";
import { loadCategories } from './api/load-categories.js';
import { loadBranches } from './api/load-branches.js';
import { loadTopics } from './api/load-topics.js';
import { loadSubtopics } from './api/load-subtopics.js';
import { loadDocuments } from './api/load-documents.js';
import { renderCategoryBar } from './render/render-category-bar.js';
import { loadVideos } from './api/load-videos.js';
import { loadSubtopicVideos } from './api/load-subtopic-videos.js';
import { loadDocumentsVideos } from './api/load-documents-videos.js';
import { loadSubtopicDocuments } from './api/load-subtopic-documents.js';
import { validateNormalizedStore } from './utils/validate-normailzed-store.js';
import { initCategoryBarEvents } from "./ui/category-bar-events.js";
import { initRouter } from "./ui/router.js";
import { loadTopicDocuments } from './api/load-topic-documents.js';
import { loadHeaderMenu } from "./api/load-header-menu.js";
import { renderSiteHeader } from "./render/render-site-header.js";
import { initSiteHeaderEvents } from "./ui/site-header-events.js";
import { initSearchOverlayEvents } from "./ui/search-overlay.js";

async function initApp() {
    try {
        // 0) UI szövegek betöltése (minden felhasználói szöveg DB-ből jön)
        await loadUiText();

        // 1) Header menu betöltése
        await loadHeaderMenu();

        // 2) Render header
        renderSiteHeader();

        // 3) Eseménykezelők (delegált)
        initSiteHeaderEvents();
        // Kereső overlay globális események (ESC, click delegation, input)
        initSearchOverlayEvents();

       // 4) Kategória sáv és fő tartalom betöltése

        //load all entities
        await loadCategories();
        await loadBranches();
        await loadTopics();
        await loadSubtopics();
        await loadVideos();
        await loadDocuments();
        
        //load relation tables
        await loadSubtopicDocuments();
        await loadSubtopicVideos();
        await loadDocumentsVideos();
        await loadTopicDocuments();

        // Build indexes and render category bar
        MenuStore.buildIndexes();
        renderCategoryBar();
        
        // Validate normalized store
        await validateNormalizedStore(MenuStore);
        
        // Initialize UI components
        initCategoryBarEvents();
        initRouter();
       
        //console.log('Documents by video:', MenuStore.index.documentsByVideo);
        //console.log('Documents by subtopic:', MenuStore.index.documentsBySubtopic);
        //console.log('Videos by subtopic:', MenuStore.index.videosBySubtopic);
        //console.log('Topic documents:', MenuStore.index.topicDocuments);

        

    } catch (error) {
        console.error('App init failed:', error);
    }
}

initApp();