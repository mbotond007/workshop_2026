import MenuStore from '../store/menu-store.js';

export function renderCategoryBar() {
    const container = document.getElementById('category-bar__list');
    container.innerHTML = '';

    for (const category of MenuStore.categories) {
        const categoryItem = createCategoryItem(category);
        container.appendChild(categoryItem);
    }
}

function createCategoryItem(category) {
    const li = document.createElement('li');
    li.className = 'category-bar__category';
    li.textContent = category.name;

    const branchList = document.createElement('ul');
    branchList.className = 'category-bar__branch-list';

    const branches =
        MenuStore.index.branchesByCategory[category.id] || [];

    for (const branch of branches) {
        branchList.appendChild(createBranchItem(branch));
    }

    li.appendChild(branchList);
    return li;
}

function createBranchItem(branch) {
    const li = document.createElement('li');
    li.className = 'category-bar__branch';
    li.textContent = branch.name;

    const topicList = document.createElement('ul');
    topicList.className = 'category-bar__topic-list';

    const topics =
        MenuStore.index.topicsByBranch[branch.id] || [];

    for (const topic of topics) {
        topicList.appendChild(createTopicItem(topic));
    }

    li.appendChild(topicList);
    return li;
}

function createTopicItem(topic) {
    const li = document.createElement('li');
    li.className = 'category-bar__topic';
    li.textContent = topic.name;

    if (topic.hasSubtopic === 1) {
        const subtopicList = document.createElement('ul');
        subtopicList.className = 'category-bar__subtopic-list';

        const subtopics =
            MenuStore.index.subtopicsByTopic[topic.id] || [];

        for (const subtopic of subtopics) {
            subtopicList.appendChild(createSubtopicItem(subtopic));
        }

        li.appendChild(subtopicList);

    } else {
        li.classList.add('category-bar__topic--direct');
        li.onclick = () => {
            console.log('Direct topic:', topic.id);
            // később: topic_documents
        };
    }

    return li;
}

function createSubtopicItem(subtopic) {
    const li = document.createElement('li');
    li.className = 'category-bar__subtopic';
    li.textContent = subtopic.name;

    li.onclick = () => {
        console.log('Subtopic:', subtopic.id);
        // később: lesson page
    };

    return li;
}
