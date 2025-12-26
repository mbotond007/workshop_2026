import MenuStore from '../store/menu-store.js';

export async function loadSubtopicVideos() {
    const response = await fetch('modules/api/load-subtopic-videos.php', {
        method: 'POST'
    });

    if (!response.ok) {
        throw new Error('Failed to load subtopic_videos');
    }

    const json = await response.json();

    if (!json.success) {
        throw new Error(json.error || 'subtopic_videos API error');
    }

    MenuStore.subtopicVideos = json.data.map(row => ({
        subtopicId: Number(row.subtopic_id),
        videoId: Number(row.video_id)
    }));
}
