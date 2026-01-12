import MenuStore from '../store/menu-store.js';

export async function loadHeaderMenu() {
  const response = await fetch("modules/api/load-header-menu.php", { method: "POST" });

  if (!response.ok) {
    throw new Error(`loadHeaderMenu failed: HTTP ${response.status}`);
  }

  const json = await response.json();

  if (!json.success) {
    throw new Error(json.error || "loadHeaderMenu failed");
  }

  // normalizálás: DB → Store
  MenuStore.headerMenu = json.data.map(row => ({
    id: Number(row.header_menu_id),
    sortOrder: Number(row.sort_order),
    isReady: Number(row.is_ready),
    action: row.action,          // pl. "open-sitemap"
    menuType: row.menu_type,     // "general" | "outside" | "inside"
    nameHu: row.header_name_hu,
    nameEn: row.header_name_en
  }));
}
