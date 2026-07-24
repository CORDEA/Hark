// Hark admin — dashboard-specific client. Shared helpers live in common.js.

const state = {
  users: [],           // GET /api/users
  alerts: [],          // GET /api/alerts (all)
  stats: null,         // GET /api/stats
  alertTypes: [],      // GET /api/alert-types
  alertTypeById: new Map(),
  triggerType: null,   // alert type id | null
  targetAll: true,
  selected: new Set(), // user_ids when !targetAll
  detailId: null,
};

function targetLabel(a) {
  if (a.is_broadcast) return t('targetLabel.all');
  const names = a.target_names || [];
  if (names.length === 0) return t('targetLabel.none');
  return names.join(', ');
}

// Foreground text picked so short uppercase labels stay legible on any admin-
// configured badge color.
function contrastText(hex) {
  const m = /^#?([0-9a-f]{6})$/i.exec(hex || '');
  if (!m) return '#fff';
  const n = parseInt(m[1], 16);
  const r = (n >> 16) & 0xff, g = (n >> 8) & 0xff, b = n & 0xff;
  const lum = (0.2126 * r + 0.7152 * g + 0.0722 * b) / 255;
  return lum > 0.6 ? '#241a04' : '#fff';
}

function typeOf(id) {
  return state.alertTypeById.get(id);
}

function typeBadge(typeId) {
  const type = typeOf(typeId);
  const label = escapeHtml(type ? type.name : typeId);
  const bg = type ? type.color : 'var(--n-5)';
  const fg = type ? contrastText(type.color) : 'var(--text-4)';
  return `<span class="badge" style="background:${bg};color:${fg}">${label}</span>`;
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
          ${escapeHtml(t('ongoing.progress', {
            time: fmtTime(a.triggered_at),
            ack: a.ack_count,
            pending: a.pending_count,
          }))}
        </div>
      </div>
      <button type="button" class="h-9 px-4 rounded-md font-bold text-sm flex-shrink-0"
              style="background:#fff;color:var(--red-6)"
              data-resolve-admin="${a.id}">${escapeHtml(t('ongoing.resolve'))}</button>
      <button type="button" class="h-9 px-4 rounded-md font-bold text-sm flex-shrink-0"
              style="background:transparent;border:1px solid var(--red-border-strong);color:var(--red-decline-text)"
              data-remind-alert="${a.id}">${escapeHtml(t('ongoing.remind'))}</button>
    </div>
  `).join('');
}

function actionLabel(a) {
  return a.status === 'active' ? t('history.action.ongoing') : t('history.action.resolved');
}

function actionColor(a) {
  return a.status === 'active' ? 'var(--red-9)' : 'var(--green-text)';
}

function renderHistory() {
  const list = q('#history-list');
  if (state.alerts.length === 0) {
    list.innerHTML = `<div class="px-5 py-6 text-sm" style="color:var(--text-5)">${escapeHtml(t('history.empty'))}</div>`;
    return;
  }
  list.innerHTML = state.alerts.map(a => {
    const dt = a.status === 'active'
      ? fmtTime(a.triggered_at)
      : t('history.rangeArrow', { from: fmtTime(a.triggered_at), to: fmtTime(a.resolved_at) });
    return `
      <div class="row-btn grid gap-4 px-5 py-3.5 border-b items-center"
           style="grid-template-columns:1.1fr 1fr 1.8fr 1.1fr;border-color:var(--n-4)"
           data-open-detail="${a.id}">
        <div>${typeBadge(a.type)}</div>
        <div class="text-sm font-semibold" style="color:${actionColor(a)}">${actionLabel(a)}</div>
        <div class="text-xs mono" style="color:var(--text-4)">${escapeHtml(dt)}</div>
        <div class="text-sm font-semibold" style="color:var(--text-2)">${escapeHtml(a.responder_name || t('empty.dash'))}</div>
      </div>
    `;
  }).join('');
}

function renderTargetList() {
  const el = q('#target-list');
  el.innerHTML = state.users
    .map(u => {
      const checked = state.targetAll || state.selected.has(u.id);
      return `
        <label class="flex items-center gap-3 px-3.5 py-2.5 rounded-md cursor-pointer">
          <input type="checkbox" class="w-5 h-5 accent-red-500 target-cb" data-uid="${u.id}" ${checked ? 'checked' : ''}>
          <span class="text-sm" style="color:var(--text-2)">${escapeHtml(u.display_name)}</span>
        </label>
      `;
    }).join('');
  const btn = q('#trigger-confirm');
  btn.textContent = t('trigger.confirmButton', { summary: triggerSummary() });
  btn.disabled = !state.targetAll && state.selected.size === 0;
  btn.style.opacity = btn.disabled ? '0.5' : '1';
  btn.style.cursor  = btn.disabled ? 'not-allowed' : 'pointer';
  applyTypeStyle(btn, state.triggerType);
}

function applyTypeStyle(el, typeId) {
  const type = typeOf(typeId);
  el.style.background = type ? type.color : 'var(--n-5)';
  el.style.color      = type ? contrastText(type.color) : 'var(--text-4)';
}

function triggerSummary() {
  if (state.targetAll) return t('trigger.summary.everyone');
  return t('trigger.summary.selected', { n: state.selected.size });
}

function selectedUserNames() {
  const byId = new Map(state.users.map(u => [u.id, u.display_name]));
  return Array.from(state.selected)
    .map(id => byId.get(id))
    .filter(Boolean);
}

// ---------- detail modal ----------
async function openDetail(id) {
  state.detailId = id;
  const detail = await api(`/api/alerts/${id}`);
  const type = typeOf(detail.type);
  const badge = q('#detail-badge');
  badge.textContent = type ? type.name : detail.type;
  badge.className = 'badge';
  if (type) {
    badge.style.background = type.color;
    badge.style.color = contrastText(type.color);
  } else {
    badge.style.background = 'var(--n-5)';
    badge.style.color = 'var(--text-4)';
  }

  const action = q('#detail-action');
  action.textContent   = actionLabel(detail);
  action.style.color   = actionColor(detail);

  q('#detail-target').textContent    = targetLabel(detail);
  q('#detail-triggered').textContent = fmtTime(detail.triggered_at);
  q('#detail-resolved').textContent  = detail.resolved_at ? fmtTime(detail.resolved_at) : t('empty.dash');
  q('#detail-responder').textContent = detail.responder_name || t('empty.dash');

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
    : `<div class="text-sm" style="color:var(--text-5)">${escapeHtml(t('detail.nobodyYet'))}</div>`;

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
  q('#detail-remind').classList.toggle('hidden', detail.status !== 'active');
  q('#detail-modal').classList.remove('hidden');
  q('#detail-modal').classList.add('flex');
}

function closeDetail() {
  q('#detail-modal').classList.add('hidden');
  q('#detail-modal').classList.remove('flex');
  state.detailId = null;
}

// ---------- trigger modal ----------
function openTrigger(typeId) {
  state.triggerType = typeId;
  state.targetAll = true;
  state.selected.clear();
  const type = typeOf(typeId);
  q('#trigger-title').textContent = type
    ? t('trigger.title.named', { name: type.name })
    : t('trigger.title.default');
  q('#target-all').checked = true;
  renderTargetList();
  const modal = q('#trigger-modal');
  modal.classList.remove('hidden');
  modal.classList.add('flex');
}

function updateTriggerButtonStyle() {
  const typeId = q('#trigger-type').value;
  applyTypeStyle(q('#btn-trigger'), typeId);
}

function renderTriggerTypeOptions() {
  const sel = q('#trigger-type');
  sel.innerHTML = state.alertTypes
    .map(t => `<option value="${escapeHtml(t.id)}">${escapeHtml(t.name)}</option>`)
    .join('');
  updateTriggerButtonStyle();
}

function closeTrigger() {
  q('#trigger-modal').classList.add('hidden');
  q('#trigger-modal').classList.remove('flex');
}

function resetTriggerState() {
  state.triggerType = null;
  state.targetAll = true;
  state.selected.clear();
}

// ---------- confirm modal ----------
function openConfirm() {
  if (!state.triggerType) return;
  if (!state.targetAll && state.selected.size === 0) return;

  const type = typeOf(state.triggerType);
  q('#confirm-title').textContent = type
    ? t('confirm.title.named', { name: type.name })
    : t('confirm.title.default');

  const recipientsEl = q('#confirm-recipients');
  if (state.targetAll) {
    recipientsEl.innerHTML = `
      <div class="text-base font-bold">${escapeHtml(t('trigger.targetAll'))}</div>
      <div class="text-xs mt-1" style="color:var(--text-5)">${escapeHtml(t('confirm.everyoneHint', { n: state.users.length }))}</div>
    `;
  } else {
    const names = selectedUserNames();
    recipientsEl.innerHTML = `
      <div class="text-xs font-semibold mb-2" style="color:var(--text-5)">${escapeHtml(t('confirm.selectedHint', { n: names.length }))}</div>
      <div class="flex flex-col gap-1.5">
        ${names.map(n => `<div class="text-sm font-semibold">${escapeHtml(n)}</div>`).join('')}
      </div>
    `;
  }

  const sendBtn = q('#confirm-send');
  sendBtn.textContent = t('confirm.sendButton');
  applyTypeStyle(sendBtn, state.triggerType);

  closeTrigger();
  const modal = q('#confirm-modal');
  modal.classList.remove('hidden');
  modal.classList.add('flex');
}

function closeConfirm() {
  q('#confirm-modal').classList.add('hidden');
  q('#confirm-modal').classList.remove('flex');
}

function backFromConfirm() {
  closeConfirm();
  renderTargetList();
  const modal = q('#trigger-modal');
  modal.classList.remove('hidden');
  modal.classList.add('flex');
}

async function sendTrigger() {
  const body = { type: state.triggerType };
  if (!state.targetAll) body.target_user_ids = Array.from(state.selected);
  try {
    await api('/api/alerts/trigger', { method: 'POST', body: JSON.stringify(body) });
    closeConfirm();
    resetTriggerState();
    await refresh();
  } catch (e) { alert(t('trigger.failed', { error: e.message })); }
}

async function resolveAdmin(id) {
  try {
    await api(`/api/alerts/${id}/resolve-admin`, { method: 'POST' });
    if (state.detailId === id) closeDetail();
    await refresh();
  } catch (e) { alert(t('detail.resolveFailed', { error: e.message })); }
}

async function remindAlert(id) {
  if (!confirm(t('detail.remindConfirm'))) return;
  try {
    const result = await api(`/api/alerts/${id}/remind-admin`, { method: 'POST' });
    alert(t('detail.remindSent', { n: result.sent }));
    await refresh();
  } catch (e) { alert(t('detail.remindFailed', { error: e.message })); }
}

// ---------- refresh loop ----------
async function loadAlertTypes() {
  try {
    const types = await api('/api/alert-types');
    state.alertTypes = types || [];
    state.alertTypeById = new Map(state.alertTypes.map(t => [t.id, t]));
    renderTriggerTypeOptions();
  } catch (e) {
    console.error('alert-types load failed', e);
  }
}

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

document.addEventListener('DOMContentLoaded', () => {
  q('#trigger-type').addEventListener('change', updateTriggerButtonStyle);
  updateTriggerButtonStyle();
  q('#btn-trigger').addEventListener('click', () => openTrigger(q('#trigger-type').value));

  const cancelTrigger = () => { closeTrigger(); resetTriggerState(); };
  const cancelConfirm = () => { closeConfirm(); resetTriggerState(); };

  q('#trigger-cancel').addEventListener('click', cancelTrigger);
  q('#trigger-confirm').addEventListener('click', openConfirm);

  q('#confirm-back').addEventListener('click', backFromConfirm);
  q('#confirm-send').addEventListener('click', sendTrigger);

  q('#detail-close').addEventListener('click', closeDetail);
  q('#detail-resolve').addEventListener('click', () => {
    if (state.detailId) resolveAdmin(state.detailId);
  });
  q('#detail-remind').addEventListener('click', () => {
    if (state.detailId) remindAlert(state.detailId);
  });

  q('#trigger-modal').addEventListener('click', (e) => {
    if (e.target === q('#trigger-modal')) cancelTrigger();
  });
  q('#confirm-modal').addEventListener('click', (e) => {
    if (e.target === q('#confirm-modal')) cancelConfirm();
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
    renderTargetList();
  });

  document.body.addEventListener('click', (e) => {
    const openId = e.target.closest('[data-open-detail]')?.dataset.openDetail;
    const resolveId = e.target.closest('[data-resolve-admin]')?.dataset.resolveAdmin;
    const remindId = e.target.closest('[data-remind-alert]')?.dataset.remindAlert;
    if (resolveId) { e.stopPropagation(); resolveAdmin(resolveId); return; }
    if (remindId) { e.stopPropagation(); remindAlert(remindId); return; }
    if (openId)    { openDetail(openId); return; }
  });

  loadAlertTypes().then(refresh);
  setInterval(refresh, 5000);
});
