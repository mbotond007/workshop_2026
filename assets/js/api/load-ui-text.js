import UiTextStore from "../store/ui-text-store.js";

export async function loadUiText() {
  const response = await fetch("modules/api/load-ui-text.php", { method: "POST" });

  if (!response.ok) {
    throw new Error(`loadUiText failed: HTTP ${response.status}`);
  }

  const json = await response.json();
  /* debug: nyers válasz naplózása
  const raw = await response.text();
  console.log("loadUiText raw response:", raw.slice(0, 200));

  let json;
  try {
    json = JSON.parse(raw);
  } catch (e) {
    throw new Error("loadUiText JSON parse failed. Raw starts with: " + raw.slice(0, 60));
  }
  vége debug */ 

  if (!json.success) {
    throw new Error(json.error || "loadUiText failed");
  }

  UiTextStore.setAll(json.data);
}
