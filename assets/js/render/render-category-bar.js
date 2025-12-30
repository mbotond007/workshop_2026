// assets/js/render/render-category-bar.js
import MenuStore from "../store/menu-store.js";
import { renderLesson } from "./render-lesson.js";

export function renderCategoryBar() {
  const container = document.getElementById("category-bar__list");
  container.innerHTML = "";

  for (const category of MenuStore.categories) {
    container.appendChild(createCategoryItem(category));
  }
}

function createCategoryItem(category) {
  const li = document.createElement("li");
  li.className = "category-bar__category";
  li.dataset.categoryId = String(category.id);

  const btn = document.createElement("button");
  btn.type = "button";
  btn.className = "category-bar__category-btn";
  btn.textContent = category.name;
  btn.dataset.action = "toggle-category";
  btn.dataset.categoryId = String(category.id);
  btn.setAttribute("aria-expanded", "false");

  const panel = document.createElement("div");
  panel.className = "category-bar__panel is-collapsed";
  panel.dataset.categoryPanel = String(category.id);

  // Branch + topic lista (branch nem kattintható)
  const branches = MenuStore.index.branchesByCategory[category.id] || [];
  for (const branch of branches) {
    panel.appendChild(createBranchBlock(branch));
  }

  li.appendChild(btn);
  document.getElementById("category-bar__inside").appendChild(panel);
  //li.appendChild(panel);
  return li;
}

function createBranchBlock(branch) {
  const section = document.createElement("section");
  section.className = "category-bar__branch-block";

  const title = document.createElement("div");
  title.className = "category-bar__branch-title";
  title.textContent = branch.name; // nem kattintható

  const list = document.createElement("ul");
  list.className = "category-bar__topic-list";

  const topics = MenuStore.index.topicsByBranch[branch.id] || [];
  for (const topic of topics) {
    list.appendChild(createTopicItem(topic));
  }

  section.appendChild(title);
  section.appendChild(list);
  return section;
}

function createTopicItem(topic) {

  //duplicate count for debugging
  console.count("category-bar click handler");

  const li = document.createElement("li");
  li.className = "category-bar__topic";

  const btn = document.createElement("button");
  btn.type = "button";
  btn.className = "category-bar__topic-btn";
  btn.textContent = topic.name;
  btn.dataset.topicId = String(topic.id);

  if (topic.hasSubtopic === 1) {
    btn.dataset.action = "toggle-topic";

    btn.setAttribute("aria-expanded", "false");

    const subList = document.createElement("ul");
    subList.className = "category-bar__subtopic-list is-collapsed";
    subList.dataset.subtopicPanel = String(topic.id);

    const subtopics = MenuStore.index.subtopicsByTopic[topic.id] || [];
    for (const subtopic of subtopics) {
      subList.appendChild(createSubtopicItem(subtopic));
    }

    li.appendChild(btn);
    li.appendChild(subList);
  } else {
    // Direct topic (topic_documents)
    btn.dataset.action = "open-direct-topic";
    li.classList.add("category-bar__topic--direct");
    li.appendChild(btn);
  }

  return li;
}

function createSubtopicItem(subtopic) {
  const li = document.createElement("li");
  li.className = "category-bar__subtopic";

  const a = document.createElement("a");
  a.className = "category-bar__subtopic-link";
  a.textContent = subtopic.name;

  // Hash routing: nincs reload, SPA marad
  a.href = `#/lesson/${subtopic.id}`;
  a.dataset.action = "open-subtopic";
  a.dataset.subtopicId = String(subtopic.id);

  li.appendChild(a);
  return li;
}

// (opcionális) export, ha a routerből is hívnád
export function openSubtopic(subtopicId) {
  renderLesson(Number(subtopicId));
}
