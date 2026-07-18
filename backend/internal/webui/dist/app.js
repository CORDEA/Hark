// Hark admin — dashboard client. Single file, no build step.
// Talks to the API on the same origin.

const state = {
  users: [],           // GET /api/users
  alerts: [],          // GET /api/alerts (all)
  stats: null,         // GET /api/stats
  triggerType: null,   // 'critical' | 'warning' | null
  targetAll: true,
  selected: new Set(), // user_ids when !targetAll
  detailId: null,
};

// ---------- fetch helpers ----------
async function api(path, opts = {}) {
  const res = await fetch(path, {
    headers: { 'content-type': 'application/json', ...(opts.headers || {}) },
    ...opts,
  });
  const body = await res.json().catch(() => null);
  if (!res.ok || (body && body.error)) {
    const msg = body?.error?.message || `${res.status} ${res.statusText}`;
    throw new Error(msg);
  }
  return body?.data;
}

const q  = (sel) => document.querySelector(sel);
const qa = (sel) => Array.from(document.querySelectorAll(sel));

// ---------- rendering ----------
function fmtTime(iso) {
  if (!iso) return '—';
  const d = new Date(iso);
  const today = new Date(); today.setHours(0, 0, 0, 0);
  const yesterday = new Date(today); yesterday.setDate(today.getDate() - 1);
  const dayStart = new Date(d); dayStart.setHours(0, 0, 0, 0);
  const time = d.toLocaleTimeString('en-GB', { hour: '2-digit', minute: '2-digit', second: '2-digit', timeZone: 'UTC' }) + ' UTC';
  if (dayStart.getTime() === today.getTime())     return `Today · ${time}`;
  if (dayStart.getTime() === yesterday.getTime()) return `Yesterday · ${time}`;
  return `${d.toISOString().slice(0, 10)} · ${time}`;
}

function targetLabel(a) {
  if (a.is_broadcast) return 'All subscribers';
  const names = a.target_names || [];
  if (names.length === 0) return 'No recipients';
  return names.join(', ');
}

function typeBadge(type) {
  const cls = type === 'critical' ? 'badge-critical' : 'badge-warning';
  return `<span class="badge ${cls}">${type}</span>`;
}

function renderStats() {
  if (!state.stats) return;
  q('#stat-active').textContent = state.stats.active_subscribers;
  q('#stat-total').textContent  = state.stats.total_subscribers;
  q('#stat-today').textContent  = state.stats.alerts_today;
}

function renderOngoing() {
  const section = q('#ongoing-section');
  const list = q('#ongoing-list');
  const ongoing = state.alerts.filter(a => a.status === 'active');
  if (ongoing.length === 0) {
    section.classList.add('hidden');
    list.innerHTML = '';
    return;
  }
  section.classList.remove('hidden');
  list.innerHTML = ongoing.map(a => `
    <div class="row-btn rounded-xl p-4 flex items-center gap-4"
         style="background:var(--red-bg-card);border:1px solid var(--red-border-card)"
         data-open-detail="${a.id}">
      <div class="pulse-dot w-2.5 h-2.5 rounded-full flex-shrink-0" style="background:var(--red-9)"></div>
      <div class="flex-1 min-w-0">
        <div class="flex items-center gap-2.5">
          ${typeBadge(a.type)}
          <div class="text-base font-bold text-white truncate">${escapeHtml(targetLabel(a))}</div>
        </div>
        <div class="text-xs mono mt-1.5" style="color:var(--red-decline-text)">
          ${escapeHtml(fmtTime(a.triggered_at))} · ${a.ack_count} acknowledged · ${a.pending_count} pending
        </div>
      </div>
      <button type="button" class="h-9 px-4 rounded-md font-bold text-sm flex-shrink-0"
              style="background:#fff;color:var(--red-6)"
              data-resolve-admin="${a.id}">Resolve</button>
    </div>
  `).join('');
}

function actionLabel(a) {
  return a.status === 'active' ? 'Ongoing' : 'Resolved';
}

function actionColor(a) {
  return a.status === 'active' ? 'var(--red-9)' : 'var(--green-text)';
}

function renderHistory() {
  const list = q('#history-list');
  if (state.alerts.length === 0) {
    list.innerHTML = `<div class="px-5 py-6 text-sm" style="color:var(--text-5)">No alerts yet. Trigger one above to see it here.</div>`;
    return;
  }
  list.innerHTML = state.alerts.map(a => {
    const dt = a.status === 'active'
      ? fmtTime(a.triggered_at)
      : `${fmtTime(a.triggered_at)} → ${fmtTime(a.resolved_at)}`;
    return `
      <div class="row-btn grid gap-4 px-5 py-3.5 border-b items-center"
           style="grid-template-columns:1.1fr 1fr 1.8fr 1.1fr;border-color:var(--n-4)"
           data-open-detail="${a.id}">
        <div>${typeBadge(a.type)}</div>
        <div class="text-sm font-semibold" style="color:${actionColor(a)}">${actionLabel(a)}</div>
        <div class="text-xs mono" style="color:var(--text-4)">${escapeHtml(dt)}</div>
        <div class="text-sm font-semibold" style="color:var(--text-2)">${escapeHtml(a.responder_name || '—')}</div>
      </div>
    `;
  }).join('');
}

function renderTargetList() {
  const el = q('#target-list');
  el.innerHTML = state.users
    .filter(u => u.status === 'active')
    .map(u => {
      const checked = state.targetAll || state.selected.has(u.id);
      return `
        <label class="flex items-center gap-3 px-3.5 py-2.5 rounded-md cursor-pointer">
          <input type="checkbox" class="w-5 h-5 accent-red-500 target-cb" data-uid="${u.id}" ${checked ? 'checked' : ''}>
          <span class="text-sm" style="color:var(--text-2)">${escapeHtml(u.display_name)}</span>
        </label>
      `;
    }).join('');
  const label = state.triggerType === 'critical'
    ? `Trigger → ${triggerSummary()}`
    : `Trigger → ${triggerSummary()}`;
  const btn = q('#trigger-send');
  btn.textContent = label;
  btn.style.background = state.triggerType === 'critical' ? 'var(--red-6)' : 'var(--amber-8)';
  btn.style.color      = state.triggerType === 'critical' ? '#fff' : '#241a04';
}

function triggerSummary() {
  if (state.targetAll) return 'everyone';
  return `${state.selected.size} selected`;
}

// ---------- detail modal ----------
async function openDetail(id) {
  state.detailId = id;
  const detail = await api(`/api/alerts/${id}`);
  const badge = q('#detail-badge');
  badge.textContent = detail.type;
  badge.className   = 'badge ' + (detail.type === 'critical' ? 'badge-critical' : 'badge-warning');

  const action = q('#detail-action');
  action.textContent   = actionLabel(detail);
  action.style.color   = actionColor(detail);

  q('#detail-target').textContent    = targetLabel(detail);
  q('#detail-triggered').textContent = fmtTime(detail.triggered_at);
  q('#detail-resolved').textContent  = detail.resolved_at ? fmtTime(detail.resolved_at) : '—';
  q('#detail-responder').textContent = detail.responder_name || '—';

  const acked    = detail.recipients.filter(r => r.response_status === 'acknowledged');
  const pending  = detail.recipients.filter(r => r.response_status === 'pending');
  const declined = detail.recipients.filter(r => r.response_status === 'declined');

  q('#detail-ack-count').textContent = acked.length;
  q('#detail-ack-list').innerHTML = acked.length
    ? acked.map(r => `
        <div class="flex justify-between text-sm">
          <span class="font-semibold" style="color:var(--text-2)">${escapeHtml(r.name)}</span>
          <span class="mono text-xs" style="color:var(--text-4)">${escapeHtml(fmtTime(r.responded_at))}</span>
        </div>`).join('')
    : `<div class="text-sm" style="color:var(--text-5)">Nobody yet</div>`;

  q('#detail-pending-count').textContent = pending.length;
  q('#detail-pending-block').classList.toggle('hidden', pending.length === 0);
  q('#detail-pending-list').innerHTML = pending.map(r =>
    `<div class="text-sm" style="color:var(--text-4)">${escapeHtml(r.name)}</div>`
  ).join('');

  q('#detail-declined-count').textContent = declined.length;
  q('#detail-declined-block').classList.toggle('hidden', declined.length === 0);
  q('#detail-declined-list').innerHTML = declined.map(r =>
    `<div class="text-sm" style="color:var(--red-decline-text)">${escapeHtml(r.name)}</div>`
  ).join('');

  q('#detail-resolve').classList.toggle('hidden', detail.status !== 'active');
  q('#detail-modal').classList.remove('hidden');
  q('#detail-modal').classList.add('flex');
}

function closeDetail() {
  q('#detail-modal').classList.add('hidden');
  q('#detail-modal').classList.remove('flex');
  state.detailId = null;
}

// ---------- trigger modal ----------
function openTrigger(type) {
  state.triggerType = type;
  state.targetAll = true;
  state.selected.clear();
  q('#trigger-title').textContent = `Trigger ${type[0].toUpperCase()}${type.slice(1)} Alert`;
  q('#target-all').checked = true;
  renderTargetList();
  const modal = q('#trigger-modal');
  modal.classList.remove('hidden');
  modal.classList.add('flex');
}

function closeTrigger() {
  q('#trigger-modal').classList.add('hidden');
  q('#trigger-modal').classList.remove('flex');
  state.triggerType = null;
}

async function sendTrigger() {
  const body = { type: state.triggerType };
  if (!state.targetAll) body.target_user_ids = Array.from(state.selected);
  try {
    await api('/api/alerts/trigger', { method: 'POST', body: JSON.stringify(body) });
    closeTrigger();
    await refresh();
  } catch (e) { alert(`Trigger failed: ${e.message}`); }
}

async function resolveAdmin(id) {
  try {
    await api(`/api/alerts/${id}/resolve-admin`, { method: 'POST' });
    if (state.detailId === id) closeDetail();
    await refresh();
  } catch (e) { alert(`Resolve failed: ${e.message}`); }
}

// ---------- refresh loop ----------
async function refresh() {
  try {
    const [stats, users, alerts] = await Promise.all([
      api('/api/stats'),
      api('/api/users'),
      api('/api/alerts?limit=100'),
    ]);
    state.stats = stats;
    state.users = users;
    state.alerts = alerts;
    renderStats();
    renderOngoing();
    renderHistory();
  } catch (e) {
    console.error('refresh failed', e);
  }
}

// ---------- event wiring ----------
function escapeHtml(s) {
  return String(s ?? '').replace(/[&<>"']/g, (c) => ({
    '&':'&amp;', '<':'&lt;', '>':'&gt;', '"':'&quot;', "'":'&#39;',
  }[c]));
}

document.addEventListener('DOMContentLoaded', () => {
  q('#btn-critical').addEventListener('click', () => openTrigger('critical'));
  q('#btn-warning').addEventListener('click',  () => openTrigger('warning'));

  q('#trigger-cancel').addEventListener('click', closeTrigger);
  q('#trigger-send').addEventListener('click', sendTrigger);

  q('#detail-close').addEventListener('click', closeDetail);
  q('#detail-resolve').addEventListener('click', () => {
    if (state.detailId) resolveAdmin(state.detailId);
  });

  q('#trigger-modal').addEventListener('click', (e) => {
    if (e.target === q('#trigger-modal')) closeTrigger();
  });
  q('#detail-modal').addEventListener('click', (e) => {
    if (e.target === q('#detail-modal')) closeDetail();
  });

  q('#target-all').addEventListener('change', (e) => {
    state.targetAll = e.target.checked;
    if (state.targetAll) state.selected.clear();
    qa('.target-cb').forEach(cb => { cb.checked = state.targetAll || state.selected.has(cb.dataset.uid); });
    renderTargetList();
  });

  q('#target-list').addEventListener('change', (e) => {
    const cb = e.target.closest('.target-cb');
    if (!cb) return;
    state.targetAll = false;
    q('#target-all').checked = false;
    if (cb.checked) state.selected.add(cb.dataset.uid); else state.selected.delete(cb.dataset.uid);
    q('#trigger-send').textContent = `Trigger → ${triggerSummary()}`;
  });

  document.body.addEventListener('click', (e) => {
    const openId = e.target.closest('[data-open-detail]')?.dataset.openDetail;
    const resolveId = e.target.closest('[data-resolve-admin]')?.dataset.resolveAdmin;
    if (resolveId) { e.stopPropagation(); resolveAdmin(resolveId); return; }
    if (openId)    { openDetail(openId); return; }
  });

  refresh();
  setInterval(refresh, 5000);
});
