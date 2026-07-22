// Hark admin — subscribers page. Shared helpers come from common.js.

const substate = { users: [], invitations: [], invite: null };

// Add-device invitations share the /api/invitations feed with new-user
// invitations, but they're modeled as a nested affordance on the owning user
// row — surfacing them as top-level "Invited" entries would double-count the
// same person.
const newUserInvitations = () =>
  substate.invitations.filter(inv => inv.kind !== 'add_device');

function renderStats() {
  const active = substate.users.length;
  const pending = newUserInvitations().length;
  q('#count-active').textContent = active;
  q('#count-invited').textContent = pending;
}

function renderRows() {
  const el = q('#rows');
  const invited = newUserInvitations();
  if (substate.users.length === 0 && invited.length === 0) {
    el.innerHTML = `<div class="px-5 py-6 text-sm" style="color:var(--text-5)">${escapeHtml(t('subscribers.empty'))}</div>`;
    return;
  }
  el.innerHTML = [
    ...substate.users.map(renderUserBlock),
    ...invited.map(renderInvitedRow),
  ].join('');
}

function renderUserBlock(u) {
  const devices = (u.devices || []).map(d => renderDeviceRow(u.id, d)).join('');
  return `
    <div class="border-b" style="border-color:var(--n-4)">
      <div class="grid gap-4 px-5 pt-4 pb-2 items-center" style="grid-template-columns:1fr auto">
        <div class="flex items-center gap-3 min-w-0">
          <div class="w-9 h-9 rounded-md flex items-center justify-center flex-shrink-0"
               style="background:var(--n-6);color:var(--text-2);font-weight:800;font-size:12px">
            ${escapeHtml(initialsOf(u.display_name))}
          </div>
          <div class="min-w-0 flex items-center gap-3 flex-wrap">
            <div class="text-base font-bold truncate" style="color:var(--text-1)">${escapeHtml(u.display_name)}</div>
            <span class="badge badge-active">${escapeHtml(t('subscribers.status.active'))}</span>
          </div>
        </div>
        <div class="flex gap-2 justify-end">
          <button type="button" title="${escapeHtml(t('subscribers.actions.testPing'))}" data-test-ping="${u.id}"
                  class="w-8 h-8 rounded-md text-sm"
                  style="border:1px solid var(--n-6);color:var(--text-4);background:transparent">↻</button>
          <button type="button" data-kick-user="${u.id}"
                  class="h-8 px-3 rounded-md font-semibold text-xs"
                  style="border:1px solid var(--red-border-strong);color:var(--red-text-muted);background:transparent">${escapeHtml(t('subscribers.actions.kick'))}</button>
        </div>
      </div>
      <div class="pl-[68px] pr-5 pb-3">
        ${devices}
        <div class="pt-1">
          <button type="button" data-add-device="${u.id}"
                  class="flex items-center gap-1.5 text-xs h-7 px-2 -ml-2 rounded-md"
                  style="color:var(--text-5);background:transparent;border:0">
            <span class="text-base leading-none">+</span> ${escapeHtml(t('subscribers.addDevice.link'))}
          </button>
        </div>
      </div>
    </div>
  `;
}

function renderDeviceRow(userId, d) {
  const name = d.device_name && d.device_name.trim() !== ''
    ? d.device_name
    : t('subscribers.device.unnamed');
  return `
    <div class="grid gap-4 items-center py-1.5" style="grid-template-columns:1fr auto">
      <div class="flex items-center gap-2 min-w-0" style="color:var(--text-3)">
        <span style="color:var(--text-6)">•</span>
        <span class="text-sm truncate">${escapeHtml(name)}</span>
      </div>
      <button type="button" data-kick-device="${d.id}" data-kick-device-user="${userId}"
              class="h-7 px-3 rounded-md font-semibold text-xs"
              style="border:1px solid var(--red-border-strong);color:var(--red-text-muted);background:transparent">${escapeHtml(t('subscribers.actions.kick'))}</button>
    </div>
  `;
}

function renderInvitedRow(inv) {
  return `
    <div class="grid gap-4 px-5 py-4 border-b items-center"
         style="grid-template-columns:1fr auto;border-color:var(--n-4)">
      <div class="flex items-center gap-3 min-w-0">
        <div class="w-9 h-9 rounded-md flex items-center justify-center flex-shrink-0"
             style="background:var(--n-6);color:var(--text-4);font-weight:800;font-size:12px">
          ${escapeHtml(initialsOf(inv.display_name))}
        </div>
        <div class="min-w-0 flex items-center gap-3 flex-wrap">
          <div class="text-base font-bold truncate" style="color:var(--text-1)">${escapeHtml(inv.display_name)}</div>
          <span class="badge badge-invited">${escapeHtml(t('subscribers.status.invited'))}</span>
        </div>
      </div>
      <div class="flex gap-2 justify-end">
        <button type="button" data-revoke="${escapeHtml(inv.code)}"
                class="h-8 px-3 rounded-md font-semibold text-xs"
                style="border:1px solid var(--red-border-strong);color:var(--red-text-muted);background:transparent">${escapeHtml(t('subscribers.actions.revoke'))}</button>
      </div>
    </div>
  `;
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
  const titleEl = q('#invite-card-title');
  if (titleEl) {
    titleEl.textContent = data.kind === 'add_device'
      ? t('invite.cardTitle.addDevice', { name: data.display_name || '' })
      : t('invite.cardTitle.newUser');
  }
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

async function addDevice(id) {
  try {
    const data = await api(`/api/users/${id}/add-device-invitations`, { method: 'POST' });
    showInviteCard(data);
    await refresh();
  } catch (e) { alert(t('subscribers.addDevice.failed', { error: e.message })); }
}

async function kickUser(id) {
  if (!confirm(t('subscribers.kick.confirm'))) return;
  try {
    await api(`/api/users/${id}`, { method: 'DELETE' });
    await refresh();
  } catch (e) { alert(t('subscribers.kick.failed', { error: e.message })); }
}

async function kickDevice(userId, deviceId) {
  if (!confirm(t('subscribers.kickDevice.confirm'))) return;
  try {
    await api(`/api/users/${userId}/devices/${deviceId}`, { method: 'DELETE' });
    await refresh();
  } catch (e) { alert(t('subscribers.kickDevice.failed', { error: e.message })); }
}

async function revokeInvitation(code) {
  if (!confirm(t('subscribers.revoke.confirm'))) return;
  try {
    await api(`/api/invitations/${encodeURIComponent(code)}`, { method: 'DELETE' });
    await refresh();
  } catch (e) { alert(t('subscribers.revoke.failed', { error: e.message })); }
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
    const pingId       = e.target.closest('[data-test-ping]')?.dataset.testPing;
    const addId        = e.target.closest('[data-add-device]')?.dataset.addDevice;
    const kickUserId   = e.target.closest('[data-kick-user]')?.dataset.kickUser;
    const kickDeviceEl = e.target.closest('[data-kick-device]');
    const revokeCode   = e.target.closest('[data-revoke]')?.dataset.revoke;
    if (pingId)            testPing(pingId);
    else if (addId)        addDevice(addId);
    else if (kickUserId)   kickUser(kickUserId);
    else if (kickDeviceEl) kickDevice(kickDeviceEl.dataset.kickDeviceUser, kickDeviceEl.dataset.kickDevice);
    else if (revokeCode)   revokeInvitation(revokeCode);
  });
  refresh();
  setInterval(refresh, 8000);
});
