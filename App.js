const form = document.getElementById('appForm');
const tbody = document.querySelector('#appTable tbody');

function loadApplicants() {
  const raw = localStorage.getItem('applicants');
  return raw ? JSON.parse(raw) : [];
}

function saveApplicants(list) {
  localStorage.setItem('applicants', JSON.stringify(list));
}

function render() {
  const list = loadApplicants();
  tbody.innerHTML = '';
  list.forEach(a => {
    const tr = document.createElement('tr');
    tr.innerHTML = `<td>${a.name}</td><td>${a.email}</td><td>${a.city}</td><td>${a.skills.join(', ')}</td>`;
    tbody.appendChild(tr);
  });
}

form.addEventListener('submit', (e) => {
  e.preventDefault();
  const a = {
    id: Date.now(),
    name: document.getElementById('name').value.trim(),
    email: document.getElementById('email').value.trim(),
    city: document.getElementById('city').value.trim(),
    skills: document.getElementById('skills').value.split(',').map(s => s.trim()).filter(Boolean),
    createdAt: new Date().toISOString()
  };
  const list = loadApplicants();
  list.push(a);
  saveApplicants(list);
  render();
  form.reset();
});

render();
