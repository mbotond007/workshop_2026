import MenuStore from './store/menu-store.js';

import { loadCategories } from './api/load-categories.js';
import { loadBranches } from './api/load-branches.js';
import { loadTopics } from './api/load-topics.js';
import { loadSubtopics } from './api/load-subtopics.js';

import { renderCategoryBar } from './render/render-category-bar.js';

async function initApp() {
    try {
        await loadCategories();
        await loadBranches();
        await loadTopics();
        await loadSubtopics();

        MenuStore.buildIndexes();
        renderCategoryBar();

    } catch (error) {
        console.error('App init failed:', error);
    }
}

initApp();
