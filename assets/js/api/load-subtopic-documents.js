import MenuStore from '../store/menu-store.js';

export async function loadSubtopicDocuments() {
    const response = await fetch('modules/api/load-subtopic-documents.php', {
        method: 'POST'
    });

    if (!response.ok) {
        throw new Error('Failed to load subtopic_documents');
    }

    const json = await response.json();

    if (!json.success) {
        throw new Error(json.error || 'subtopic_documents API error');
    }

    MenuStore.subtopicDocuments = json.data.map(row => ({
        subtopicId: Number(row.subtopic_id),
        documentId: Number(row.document_id)
    }));
}
