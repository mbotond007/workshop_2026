import MenuStore from '../store/menu-store.js';

export async function loadDocuments() {
    const response = await fetch('modules/api/load-documents.php', {
        method: 'POST'
    });

    if (!response.ok) {
        throw new Error('Failed to load documents');
    }

    const json = await response.json();

    if (!json.success) {
        throw new Error(json.error || 'Documents API error');
    }

    const DOCUMENT_BASE_URL = './';

    MenuStore.documents = json.data.map(row => ({
        id: Number(row.document_id),
        title: row.title_hu,
        description: row.description_hu,
        type: row.document_type,
        path: row.file_url,
        url: row.file_url.startsWith('http')
            ? row.file_url
            : DOCUMENT_BASE_URL + row.file_url.replace(/^\/+/, '')
    }));
}
