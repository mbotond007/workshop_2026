/**
 * Egyszerű kereső normalizálás / scoring helper.
 * Nincs külső lib.
 */

export function normalizeText(str) {
  if (!str) return "";

  const lowered = String(str).toLowerCase();
  // Hungarian ékezetek eltávolítása: NFD + combining marks
  const noDiacritics = lowered
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "");

  return noDiacritics.replace(/\s+/g, " ").trim();
}

/**
 * Durva, de hatékony pontozás.
 * - prefix match: erős
 * - contains match: gyengébb
 */
export function scoreMatch(haystackNorm, needleNorm) {
  if (!haystackNorm || !needleNorm) return 0;
  if (haystackNorm === needleNorm) return 100;
  if (haystackNorm.startsWith(needleNorm)) return 80;
  if (haystackNorm.includes(needleNorm)) return 40;
  return 0;
}
