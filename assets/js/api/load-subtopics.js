import MenuStore from '../store/menu-store.js';

export async function loadSubtopics() {
    const response = await fetch('modules/api/load-subtopics.php', {
        method: 'POST'
    });

    if (!response.ok) {
        throw new Error('Failed to load subtopics');
    }

    const json = await response.json();

    if (!json.success) {
        throw new Error(json.error || 'Subtopics API error');
    }

    MenuStore.subtopics = json.data.map(row => ({
        id: row.subtopic_id,
        topicId: row.topic_id,
        name: row.subtopic_name_hu,
        sortOrder: row.sort_order
    }));
}
