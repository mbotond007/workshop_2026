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
       
        
       
        //console.log('Documents by video:', MenuStore.index.documentsByVideo);
        console.log('Documents by subtopic:', MenuStore.index.documentsBySubtopic);

        MenuStore.buildIndexes();
        renderCategoryBar();

    } catch (error) {
        console.error('App init failed:', error);
    }
}

initApp();
