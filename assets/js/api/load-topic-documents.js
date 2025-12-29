import MenuStore from "../store/menu-store.js";

export async function loadTopicDocuments() {
  const response = await fetch("modules/api/load-topic-documents.php", {
    method: "POST",
  });

  if (!response.ok) {
    throw new Error("Failed to load topic_documents");
  }

  const json = await response.json();
  if (!json.success) {
    throw new Error(json.error || "topic_documents API error");
  }

  MenuStore.topicDocuments = json.data.map((row) => ({
    topicId: Number(row.topic_id),
    documentId: Number(row.document_id),
  }));
}
