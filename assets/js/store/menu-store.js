// assets/js/store/MenuStore.js

const MenuStore = {

    // --- raw tables ---
    categories: [],
    branches: [],
    topics: [],
    subtopics: [],

    documents: [],
    videos: [],

    // --- relation tables ---
    topicDocuments: [],
    subtopicDocuments: [],
    subtopicVideos: [],
    documentsVideos: [],

    // --- indexed views (runtime-built) ---
    index: {
        branchesByCategory: {},
        topicsByBranch: {},
        subtopicsByTopic: {},

        documentsByTopic: {},
        documentsBySubtopic: {},

        videosBySubtopic: {},
        documentsByVideo: {}
    },

    // --- state ---
    isLoaded: false,

    // --- lifecycle ---
    init() {
        this.buildIndexes();
        this.isLoaded = true;
    },

    buildIndexes() {

    // --- branchesByCategory ---
    this.index.branchesByCategory = {};
    // populate index
    for (const branch of this.branches) {
        const categoryId = branch.categoryId;
        // create array if not exists
        if (!this.index.branchesByCategory[categoryId]) {
            this.index.branchesByCategory[categoryId] = [];
        }
        // push branch into array
        this.index.branchesByCategory[categoryId].push(branch);
    }

    // --- topicsByBranch ---
    this.index.topicsByBranch = {};

    for (const topic of this.topics) {
        const branchId = topic.branchId;

        if (!this.index.topicsByBranch[branchId]) {
            this.index.topicsByBranch[branchId] = [];
        }

        this.index.topicsByBranch[branchId].push(topic);
    }
   
    
    // --- subtopicsByTopic ---
    this.index.subtopicsByTopic = {};

    for (const subtopic of this.subtopics) {
        const topicId = subtopic.topicId;

        if (!this.index.subtopicsByTopic[topicId]) {
            this.index.subtopicsByTopic[topicId] = [];
        }

        this.index.subtopicsByTopic[topicId].push(subtopic);
    
    }
    
    // --- videosBySubtopic ---
    this.index.videosBySubtopic = {};

    this.subtopicVideos.forEach(rel => {
    if (!this.index.videosBySubtopic[rel.subtopicId]) {
        this.index.videosBySubtopic[rel.subtopicId] = [];
    }
    this.index.videosBySubtopic[rel.subtopicId].push(rel.videoId);
    });

    // --- documentsByVideo ---
    this.index.documentsByVideo = {};

    this.documentsVideos.forEach(rel => {
    if (!this.index.documentsByVideo[rel.videoId]) {
        this.index.documentsByVideo[rel.videoId] = [];
    }
    this.index.documentsByVideo[rel.videoId].push(rel.documentId);
    });

    // --- documentsBySubtopic ---
    this.index.documentsBySubtopic = {};

    this.subtopicDocuments.forEach(rel => {
        if (!this.index.documentsBySubtopic[rel.subtopicId]) {
            this.index.documentsBySubtopic[rel.subtopicId] = [];
        }
        this.index.documentsBySubtopic[rel.subtopicId].push(rel.documentId);
    });

    },

    clear() {
        // reset store (pl. logout / hard reload)
    }
};

export default MenuStore;
