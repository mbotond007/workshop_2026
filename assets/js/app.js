import MenuStore from './store/menu-store.js';

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

async function initApp() {
    try {
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

        // Initialize UI components
        await initCategoryBarEvents();
        await initRouter();
        
        // Validate normalized store
        await validateNormalizedStore(MenuStore);
        
       
        //console.log('Documents by video:', MenuStore.index.documentsByVideo);
        console.log('Documents by subtopic:', MenuStore.index.documentsBySubtopic);

        MenuStore.buildIndexes();
        renderCategoryBar();

    } catch (error) {
        console.error('App init failed:', error);
    }
}

initApp();
validateNormalizedStore(MenuStore);