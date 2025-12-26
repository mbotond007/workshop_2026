import MenuStore from '../store/menu-store.js';

export async function loadDocumentsVideos() {
    const response = await fetch('modules/api/load-documents-videos.php', {
        method: 'POST'
    });

    if (!response.ok) {
        throw new Error('Failed to load documents_videos');
    }

    const json = await response.json();

    if (!json.success) {
        throw new Error(json.error || 'documents_videos API error');
    }

    MenuStore.documentsVideos = json.data.map(row => ({
        videoId: Number(row.video_id),
        documentId: Number(row.document_id)
    }));
}
