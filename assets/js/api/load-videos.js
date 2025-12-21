import MenuStore from '../store/menu-store.js';

export async function loadVideos() {
    const response = await fetch('modules/api/load-videos.php', {
        method: 'POST'
    });

    if (!response.ok) {
        throw new Error('Failed to load videos');
    }

    const json = await response.json();

    if (!json.success) {
        throw new Error(json.error || 'Videos API error');
    }

    MenuStore.videos = json.data.map(row => ({
        id: row.video_id,
        title: row.video_title,
        description: row.description,
        youtubeId: row.youtube_id,
        duration: row.duration_ms,
        publishedAt: row.published_date
    }));
}
