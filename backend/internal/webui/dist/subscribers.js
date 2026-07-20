// Hark admin — subscribers page. Shared helpers come from common.js.

const substate = { users: [], invitations: [], invite: null };

function renderStats() {
  const active = substate.users.filter(u => (u.devices_count ?? (u.devices?.length || 0)) > 0).length;
  const pending = substate.invitations.length;
  q('#count-active').textContent = active;
  q('#count-invited').textContent = pending;
}

function renderRows() {
  const el = q('#rows');
  if (substate.users.length === 0) {
    el.innerHTML = `<div class="px-5 py-6 text-sm" style="color:var(--text-5)">${escapeHtml(t('subscribers.empty'))}</div>`;
    return;
  }
  el.innerHTML = substate.users.map(u => {
    const device = u.devices && u.devices[0] ? u.devices[0].device_name : t('empty.dash');
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
        <div class="text-xs mono" style="color:var(--text-4)">
          ${u.credentials_count ?? 0} passkeys · ${u.devices_count ?? (u.devices?.length || 0)} devices
        </div>
        <div class="text-xs mono" style="color:var(--text-4)">${escapeHtml(lastActivity(u.last_activity_at))}</div>
        <div class="flex gap-2 justify-end">
          <button type="button" title="${escapeHtml(t('subscribers.actions.testPing'))}" data-test-ping="${u.id}"
                  class="w-8 h-8 rounded-md text-sm"
                  style="border:1px solid var(--n-6);color:var(--text-4);background:transparent">↻</button>
          <button type="button" data-kick="${u.id}"
                  class="h-8 px-3 rounded-md font-semibold text-xs"
                  style="border:1px solid var(--red-border-strong);color:var(--red-text-muted);background:transparent">${escapeHtml(t('subscribers.actions.kick'))}</button>
        </div>
      </div>
    `;
  }).join('');
}

async function refresh() {
  try {
    const [users, invitations] = await Promise.all([
      api('/api/users'),
      api('/api/invitations').catch(() => []),
    ]);
    substate.users = users;
    substate.invitations = invitations || [];
    renderStats();
    renderRows();
  } catch (e) { console.error('refresh failed', e); }
}

function showInviteCard(data) {
  substate.invite = data;
  q('#invite-card').classList.remove('hidden');
  q('#invite-server-url').textContent = data.server_url;
  q('#invite-code').textContent = data.code;
  q('#invite-qr').src = data.qr_image;
}

function flashCopied(btn) {
  const original = btn.textContent;
  btn.textContent = t('invite.copied');
  btn.disabled = true;
  setTimeout(() => {
    btn.textContent = original;
    btn.disabled = false;
  }, 1200);
}

async function copyText(text, btn) {
  try {
    await navigator.clipboard.writeText(text);
    flashCopied(btn);
  } catch (_) {}
}

function downloadQr() {
  const data = substate.invite;
  if (!data?.qr_image) return;
  const a = document.createElement('a');
  a.href = data.qr_image;
  a.download = `hark-invite-${data.code || 'qr'}.png`;
  document.body.appendChild(a);
  a.click();
  document.body.removeChild(a);
}

function openInviteDialog() {
  const modal = q('#invite-modal');
  modal.classList.remove('hidden');
  modal.classList.add('flex');
  q('#invite-error').classList.add('hidden');
  const input = q('#invite-name');
  input.value = '';
  input.focus();
}

function closeInviteDialog() {
  const modal = q('#invite-modal');
  modal.classList.add('hidden');
  modal.classList.remove('flex');
}

async function submitInvite(displayName) {
  const errEl = q('#invite-error');
  const submitBtn = q('#invite-create');
  submitBtn.disabled = true;
  try {
    const data = await api('/api/invitations', {
      method: 'POST',
      body: JSON.stringify({ display_name: displayName }),
    });
    closeInviteDialog();
    showInviteCard(data);
    await refresh();
  } catch (e) {
    errEl.textContent = t('invite.failed', { error: e.message });
    errEl.classList.remove('hidden');
  } finally {
    submitBtn.disabled = false;
  }
}

async function testPing(id) {
  try {
    const data = await api(`/api/users/${id}/test-ping`, { method: 'POST' });
    alert(t('subscribers.testPing.sent', { n: data.sent }));
  } catch (e) { alert(t('subscribers.testPing.failed', { error: e.message })); }
}

async function kick(id) {
  if (!confirm(t('subscribers.kick.confirm'))) return;
  try {
    await api(`/api/users/${id}`, { method: 'DELETE' });
    await refresh();
  } catch (e) { alert(t('subscribers.kick.failed', { error: e.message })); }
}

document.addEventListener('DOMContentLoaded', () => {
  q('#btn-invite').addEventListener('click', openInviteDialog);
  q('#invite-cancel').addEventListener('click', closeInviteDialog);
  q('#invite-form').addEventListener('submit', (e) => {
    e.preventDefault();
    submitInvite(q('#invite-name').value);
  });
  q('#invite-modal').addEventListener('click', (e) => {
    if (e.target.id === 'invite-modal') closeInviteDialog();
  });
  q('#btn-invite-close').addEventListener('click', () => {
    q('#invite-card').classList.add('hidden');
    substate.invite = null;
  });
  q('#btn-copy-server').addEventListener('click', (e) => {
    if (substate.invite) copyText(substate.invite.server_url, e.currentTarget);
  });
  q('#btn-copy-code').addEventListener('click', (e) => {
    if (substate.invite) copyText(substate.invite.code, e.currentTarget);
  });
  q('#btn-download-qr').addEventListener('click', downloadQr);
  document.body.addEventListener('click', (e) => {
    const pingId = e.target.closest('[data-test-ping]')?.dataset.testPing;
    const kickId = e.target.closest('[data-kick]')?.dataset.kick;
    if (pingId)     testPing(pingId);
    else if (kickId) kick(kickId);
  });
  refresh();
  setInterval(refresh, 8000);
});
