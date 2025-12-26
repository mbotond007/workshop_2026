export function validateNormalizedStore(MenuStore) {
  const errors = [];

  // ENTITÁSOK
  for (const v of (MenuStore.videos || [])) {
    if (typeof v.id !== 'number') errors.push(`videos.id not number: ${v.id}`);
    if (typeof v.title !== 'string') errors.push(`videos.title not string: ${v.title}`);
    // ha van: youtubeId, duration, curriculum_order stb.
  }

  for (const d of (MenuStore.documents || [])) {
    if (typeof d.id !== 'number') errors.push(`documents.id not number: ${d.id}`);
    if (typeof d.title !== 'string') errors.push(`documents.title not string: ${d.title}`);
    if (typeof (d.url || d.path) !== 'string') errors.push(`documents missing url/path: ${d.id}`);
  }

  // RELÁCIÓK (példák)
  for (const rel of (MenuStore.documentsVideos || [])) {
    if (typeof rel.videoId !== 'number') errors.push(`documentsVideos.videoId not number`);
    if (typeof rel.documentId !== 'number') errors.push(`documentsVideos.documentId not number`);
  }

  for (const rel of (MenuStore.subtopicDocuments || [])) {
    if (typeof rel.subtopicId !== 'number') errors.push(`subtopicDocuments.subtopicId not number`);
    if (typeof rel.documentId !== 'number') errors.push(`subtopicDocuments.documentId not number`);
  }

  if (errors.length) {
    console.warn('Normalization errors:', errors);
  } else {
    console.log('Normalization OK ✅');
  }
}
