import MenuStore from './store/menu-store.js';

// ideiglenes teszt
console.log('MenuStore loaded:', MenuStore);

// ideiglenes tesztadat
MenuStore.branches = [
  { id: 1, categoryId: 10, name: 'Branch A' },
  { id: 2, categoryId: 10, name: 'Branch B' },
  { id: 3, categoryId: 20, name: 'Branch C' }
];

MenuStore.buildIndexes();

console.log('Branches by Category Index:', MenuStore.index.branchesByCategory);

MenuStore.topics = [
  { id: 1, branchId: 10, name: 'Topic A', hasSubtopic: 1 },
  { id: 2, branchId: 10, name: 'Topic B', hasSubtopic: 0 },
  { id: 3, branchId: 20, name: 'Topic C', hasSubtopic: 1 }
];

MenuStore.buildIndexes();

console.log('Topics by Branches', MenuStore.index.topicsByBranch);

MenuStore.subtopics = [
  { id: 1, topicId: 10, name: 'Sub A' },
  { id: 2, topicId: 10, name: 'Sub B' },
  { id: 3, topicId: 20, name: 'Sub C' }
];

MenuStore.buildIndexes();

console.log('Subtopics by Topics', MenuStore.index.subtopicsByTopic);

// render category bar

import { renderCategoryBar } from './render/render-category-bar.js';

MenuStore.buildIndexes();
renderCategoryBar();
console.log('Category bar rendered.');
