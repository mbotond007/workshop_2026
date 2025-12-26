import MenuStore from '../store/menu-store.js';

export async function loadTopics() {
    const response = await fetch('modules/api/load-topics.php', {
        method: 'POST'
    });

    if (!response.ok) {
        throw new Error('Failed to load topics');
    }

    const json = await response.json();

    if (!json.success) {
        throw new Error(json.error || 'Topics API error');
    }

    MenuStore.topics = json.data.map(row => ({
        id: Number(row.topic_id),
        branchId: Number(row.branch_id),
        name: row.topic_name_hu,
        hasSubtopic: Number(row.has_subtopic),
        sortOrder: Number(row.sort_order)
    }));
}
