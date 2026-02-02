/* =========================
   To-Do List (Bootstrap 5)
   - Vanilla JS
   - localStorage persistence
   - Event delegation
   - Array of objects for tasks
========================= */

const STORAGE_KEY = "int250_todo_tasks_v1";

let tasks = [];
let currentFilter = "all";     // all | active | completed
let currentSearch = "";        // search keyword

// Elements
const addForm = document.getElementById("addForm");
const taskTitleInput = document.getElementById("taskTitle");
const taskPrioritySelect = document.getElementById("taskPriority");

const searchInput = document.getElementById("searchInput");
const taskListEl = document.getElementById("taskList");
const emptyStateEl = document.getElementById("emptyState");

const counterEl = document.getElementById("counter");
const clearCompletedBtn = document.getElementById("clearCompletedBtn");

const filterButtons = document.querySelectorAll("[data-filter]");

// Edit modal elements
const editModalEl = document.getElementById("editModal");
const editForm = document.getElementById("editForm");
const editTaskIdInput = document.getElementById("editTaskId");
const editTitleInput = document.getElementById("editTitle");
const editPrioritySelect = document.getElementById("editPriority");
const editModal = new bootstrap.Modal(editModalEl);

/* ---------- Utilities ---------- */
function escapeHtml(str) {
  return String(str)
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}

function generateId() {
  // stable enough for this exercise
  return `${Date.now()}_${Math.random().toString(16).slice(2)}`;
}

function normalize(s) {
  return String(s || "").trim().toLowerCase();
}

function priorityLabel(p) {
  if (p === "high") return "High";
  if (p === "medium") return "Medium";
  return "Low";
}

function priorityBadgeClass(p) {
  // ใช้คลาส bootstrap
  if (p === "high") return "text-bg-danger";
  if (p === "medium") return "text-bg-warning";
  return "text-bg-success";
}

/* ---------- Storage ---------- */
function saveTasks() {
  localStorage.setItem(STORAGE_KEY, JSON.stringify(tasks));
}

function loadTasks() {
  const raw = localStorage.getItem(STORAGE_KEY);
  if (!raw) return [];
  try {
    const data = JSON.parse(raw);
    if (Array.isArray(data)) return data;
    return [];
  } catch {
    return [];
  }
}

/* ---------- Core Operations ---------- */
function addTask(title, priority) {
  const t = {
    id: generateId(),
    title: title.trim(),
    completed: false,
    priority: priority || "medium",
    createdAt: Date.now(),
  };
  tasks.unshift(t); // new task on top
  saveTasks();
  render();
}

function deleteTask(id) {
  tasks = tasks.filter(t => t.id !== id);
  saveTasks();
  render();
}

function toggleComplete(id) {
  const t = tasks.find(x => x.id === id);
  if (!t) return;
  t.completed = !t.completed;
  saveTasks();
  render();
}

function updateTask(id, newTitle, newPriority) {
  const t = tasks.find(x => x.id === id);
  if (!t) return;
  t.title = newTitle.trim();
  t.priority = newPriority;
  saveTasks();
  render();
}

function clearCompleted() {
  const before = tasks.length;
  tasks = tasks.filter(t => !t.completed);
  if (tasks.length !== before) {
    saveTasks();
    render();
  }
}

/* ---------- Filtering / Searching ---------- */
function getVisibleTasks() {
  let list = [...tasks];

  // filter
  if (currentFilter === "active") {
    list = list.filter(t => !t.completed);
  } else if (currentFilter === "completed") {
    list = list.filter(t => t.completed);
  }

  // search (case-insensitive)
  const key = normalize(currentSearch);
  if (key) {
    list = list.filter(t => normalize(t.title).includes(key));
  }

  return list;
}

/* ---------- Render ---------- */
function renderCounters() {
  const total = tasks.length;
  const completed = tasks.filter(t => t.completed).length;
  const active = total - completed;

  counterEl.textContent = `${total} total • ${active} active • ${completed} completed`;

  // enable/disable clear completed
  clearCompletedBtn.disabled = completed === 0;
}

function renderList() {
  const visible = getVisibleTasks();

  if (visible.length === 0) {
    taskListEl.innerHTML = "";
    emptyStateEl.classList.remove("d-none");
    return;
  }

  emptyStateEl.classList.add("d-none");

  const html = visible.map(t => {
    const safeTitle = escapeHtml(t.title);
    const checked = t.completed ? "checked" : "";
    const completedClass = t.completed ? "task-completed" : "";

    return `
      <div class="task-card p-3 ${completedClass}" data-id="${t.id}">
        <div class="d-flex align-items-start justify-content-between gap-3">
          <div class="d-flex align-items-start gap-3 flex-grow-1">
            <div class="form-check mt-1">
              <input class="form-check-input js-toggle" type="checkbox" ${checked} aria-label="toggle complete" />
            </div>

            <div class="flex-grow-1">
              <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="task-title fw-semibold">${safeTitle}</div>
                <span class="badge ${priorityBadgeClass(t.priority)}">${priorityLabel(t.priority)}</span>
              </div>
              <div class="small text-muted mt-1">
                ${t.completed ? "Completed" : "Active"} • ${new Date(t.createdAt).toLocaleString()}
              </div>
            </div>
          </div>

          <div class="d-flex gap-2">
            <button class="btn btn-outline-secondary btn-sm js-edit" type="button" title="Edit">
              ✏️
            </button>
            <button class="btn btn-outline-danger btn-sm js-delete" type="button" title="Delete">
              🗑
            </button>
          </div>
        </div>
      </div>
    `;
  }).join("");

  taskListEl.innerHTML = html;
}

function render() {
  renderCounters();
  renderList();
}

/* ---------- Event Handlers ---------- */

// Add task (submit)
addForm.addEventListener("submit", (e) => {
  e.preventDefault();
  const title = taskTitleInput.value;
  const priority = taskPrioritySelect.value;

  if (!title || title.trim().length === 0) {
    taskTitleInput.focus();
    return;
  }

  addTask(title, priority);
  taskTitleInput.value = "";
  taskTitleInput.focus();
});

// Search
searchInput.addEventListener("input", (e) => {
  currentSearch = e.target.value || "";
  render();
});

// Filters
filterButtons.forEach(btn => {
  btn.addEventListener("click", () => {
    currentFilter = btn.dataset.filter;

    // update active class
    filterButtons.forEach(b => b.classList.remove("active"));
    btn.classList.add("active");

    render();
  });
});

// Clear Completed
clearCompletedBtn.addEventListener("click", () => {
  clearCompleted();
});

// Event Delegation for list actions (toggle/edit/delete)
taskListEl.addEventListener("click", (e) => {
  const card = e.target.closest(".task-card");
  if (!card) return;

  const id = card.dataset.id;
  if (!id) return;

  // Delete
  if (e.target.closest(".js-delete")) {
    deleteTask(id);
    return;
  }

  // Edit
  if (e.target.closest(".js-edit")) {
    openEditModal(id);
    return;
  }
});

// Toggle checkbox (change event is safer for checkbox)
taskListEl.addEventListener("change", (e) => {
  const card = e.target.closest(".task-card");
  if (!card) return;

  const id = card.dataset.id;
  if (!id) return;

  if (e.target.classList.contains("js-toggle")) {
    toggleComplete(id);
  }
});

/* ---------- Edit Modal ---------- */
function openEditModal(id) {
  const t = tasks.find(x => x.id === id);
  if (!t) return;

  editTaskIdInput.value = t.id;
  editTitleInput.value = t.title;
  editPrioritySelect.value = t.priority;

  editModal.show();

  // focus after modal show
  setTimeout(() => editTitleInput.focus(), 150);
}

editForm.addEventListener("submit", (e) => {
  e.preventDefault();

  const id = editTaskIdInput.value;
  const newTitle = editTitleInput.value;
  const newPriority = editPrioritySelect.value;

  if (!newTitle || newTitle.trim().length === 0) {
    editTitleInput.focus();
    return;
  }

  updateTask(id, newTitle, newPriority);
  editModal.hide();
});

// UX: Press Enter in editTitle input submits naturally; ok.

/* ---------- Init ---------- */
(function init() {
  tasks = loadTasks();

  // (Optional) migration / sanitize
  tasks = tasks
    .filter(t => t && typeof t === "object")
    .map(t => ({
      id: String(t.id || generateId()),
      title: String(t.title || "").trim(),
      completed: Boolean(t.completed),
      priority: ["low", "medium", "high"].includes(t.priority) ? t.priority : "medium",
      createdAt: typeof t.createdAt === "number" ? t.createdAt : Date.now(),
    }))
    .filter(t => t.title.length > 0);

  saveTasks(); // normalize storage
  render();
})();
