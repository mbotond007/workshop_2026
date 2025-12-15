import MenuStore from '../store/menu-store.js';

export async function loadCategories() {
    const response = await fetch('modules/api/load-categories.php', {
        method: 'POST'
    });

    if (!response.ok) {
        throw new Error('Failed to load categories');
    }

    const json = await response.json();

    if (!json.success) {
        throw new Error(json.error || 'Category API error');
    }

    // normalizálás: DB → Store
    MenuStore.categories = json.data.map(row => ({
        id: row.category_id,
        name: row.category_name_hu,
        sortOrder: row.sort_order
    }));
}
