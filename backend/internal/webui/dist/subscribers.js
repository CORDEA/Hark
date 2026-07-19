// Hark admin — subscribers page. Shared helpers come from common.js.

const substate = { users: [] };

function statusBadge(status) {
  if (status === 'active') return `<span class="badge badge-active">Active</span>`;
  return `<span class="badge badge-invited">Invited</span>`;
}

function renderStats() {
  const active = substate.users.filter(u => u.status === 'active').length;
  const invited = substate.users.filter(u => u.status === 'invited').length;
  q('#count-active').textContent = active;
  q('#count-invited').textContent = invited;
}

function renderRows() {
  const el = q('#rows');
  if (substate.users.length === 0) {
    el.innerHTML = `<div class="px-5 py-6 text-sm" style="color:var(--text-5)">
      No subscribers yet. Tap “Invite New User” to add one.
    </div>`;
    return;
  }
  el.innerHTML = substate.users.map(u => {
    const device = u.devices && u.devices[0]
      ? u.devices[0].device_name
      : (u.status === 'invited' ? 'Awaiting device' : '—');
    return `
      <div class="grid gap-4 px-5 py-4 border-b items-center"
           style="grid-template-columns:2fr 1fr 1.3fr 1.6fr;border-color:var(--n-4)">
        <div class="flex items-center gap-3 min-w-0">
          <div class="w-9 h-9 rounded-md flex items-center justify-center flex-shrink-0"
               style="background:var(--n-6);color:var(--text-2);font-weight:800;font-size:12px">
            ${escapeHtml(initialsOf(u.display_name))}
          </div>
          <div class="min-w-0">
            <div class="text-base font-bold truncate" style="color:var(--text-1)">${escapeHtml(u.display_name)}</div>
            <div class="text-xs" style="color:var(--text-5)">${escapeHtml(device)}</div>
          </div>
        </div>
        <div>${statusBadge(u.status)}</div>
        <div class="text-xs mono" style="color:var(--text-4)">${escapeHtml(lastActivity(u.last_activity_at))}</div>
        <div class="flex gap-2 justify-end">
          <button type="button" title="Test Ping" data-test-ping="${u.id}"
                  class="w-8 h-8 rounded-md text-sm"
                  style="border:1px solid var(--n-6);color:var(--text-4);background:transparent">↻</button>
          <button type="button" data-reinvite="${u.id}"
                  class="h-8 px-3 rounded-md font-semibold text-xs"
                  style="border:1px solid var(--n-6);color:var(--text-4);background:transparent">Re-invite</button>
          <button type="button" data-kick="${u.id}"
                  class="h-8 px-3 rounded-md font-semibold text-xs"
                  style="border:1px solid var(--red-border-strong);color:var(--red-text-muted);background:transparent">Kick</button>
        </div>
      </div>
    `;
  }).join('');
}

async function refresh() {
  try {
    substate.users = await api('/api/users');
    renderStats();
    renderRows();
  } catch (e) { console.error('refresh failed', e); }
}

async function openInvite() {
  try {
    const data = await api('/api/invite', { method: 'POST', body: '{}' });
    q('#invite-card').classList.remove('hidden');
    q('#invite-url').textContent = data.deep_link;
    q('#invite-url').dataset.deepLink = data.deep_link;
    // Render QR client-side so no server code has to generate images.
    const canvas = q('#invite-qr');
    const ctx = canvas.getContext('2d');
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    // eslint-disable-next-line no-undef
    QRCode.toCanvas(canvas, data.qr_payload, { width: 140, margin: 0 }, (err) => {
      if (err) console.error('qr', err);
    });
    await refresh(); // pick up the new "invited" row immediately
  } catch (e) { alert(`Invite failed: ${e.message}`); }
}

async function reinvite(id) {
  try {
    const data = await api(`/api/users/${id}/reinvite`, { method: 'POST' });
    q('#invite-card').classList.remove('hidden');
    q('#invite-url').textContent = data.deep_link;
    q('#invite-url').dataset.deepLink = data.deep_link;
    const canvas = q('#invite-qr');
    canvas.getContext('2d').clearRect(0, 0, canvas.width, canvas.height);
    // eslint-disable-next-line no-undef
    QRCode.toCanvas(canvas, data.qr_payload, { width: 140, margin: 0 });
    await refresh();
  } catch (e) { alert(`Re-invite failed: ${e.message}`); }
}

async function testPing(id) {
  try {
    const data = await api(`/api/users/${id}/test-ping`, { method: 'POST' });
    alert(`Test ping sent to ${data.sent} device(s).`);
  } catch (e) { alert(`Test ping failed: ${e.message}`); }
}

async function kick(id) {
  if (!confirm('Kick this subscriber? Their devices lose access immediately.')) return;
  try {
    await api(`/api/users/${id}`, { method: 'DELETE' });
    await refresh();
  } catch (e) { alert(`Kick failed: ${e.message}`); }
}

document.addEventListener('DOMContentLoaded', () => {
  q('#btn-invite').addEventListener('click', openInvite);
  q('#btn-invite-close').addEventListener('click', () => {
    q('#invite-card').classList.add('hidden');
  });
  q('#btn-copy').addEventListener('click', () => {
    const url = q('#invite-url').dataset.deepLink || q('#invite-url').textContent;
    navigator.clipboard.writeText(url).catch(() => {});
  });
  document.body.addEventListener('click', (e) => {
    const pingId = e.target.closest('[data-test-ping]')?.dataset.testPing;
    const reinviteId = e.target.closest('[data-reinvite]')?.dataset.reinvite;
    const kickId = e.target.closest('[data-kick]')?.dataset.kick;
    if (pingId)     testPing(pingId);
    else if (reinviteId) reinvite(reinviteId);
    else if (kickId)     kick(kickId);
  });
  refresh();
  setInterval(refresh, 8000);
});
