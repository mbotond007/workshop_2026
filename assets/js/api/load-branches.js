import MenuStore from '../store/menu-store.js';

export async function loadBranches() {
    const response = await fetch('modules/api/load-branches.php', {
        method: 'POST'
    });

    if (!response.ok) {
        throw new Error('Failed to load branches');
    }

    const json = await response.json();

    if (!json.success) {
        throw new Error(json.error || 'Branches API error');
    }

    // normalizálás: DB → Store
    MenuStore.branches = json.data.map(row => ({
        id: row.branch_id,
        categoryId: row.category_id,
        name: row.branch_name_hu,
        sortOrder: row.sort_order
    }));
}
