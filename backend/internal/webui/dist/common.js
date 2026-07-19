// Hark admin — shared helpers used by both dashboard.js and subscribers.js.

// --- i18n -----------------------------------------------------------------
// Small dictionary-based localizer. Add a new locale by dropping another
// object into `catalogs` and the picker will match based on navigator.language.
// Formatter args: t('key', { count: 3 }).
const catalogs = {
  en: {
    'header.tagline': 'On-call notification control',
    'header.title': 'Hark Admin',
    'header.activeSubscribers': 'Active subscribers',
    'header.alertsToday': 'Alerts today',
    'header.subscribers': 'Subscribers →',

    'broadcast.section': 'Broadcast an alert',
    'broadcast.critical': 'Trigger Critical Alert',
    'broadcast.warning': 'Trigger Warning Alert',

    'ongoing.section': 'Ongoing alerts',
    'ongoing.resolve': 'Resolve',
    'ongoing.progress': '{time} · {ack} acknowledged · {pending} pending',

    'history.section': 'Alert history',
    'history.subtitle': 'Chronological log of every alert broadcast from this org · click a row for detail',
    'history.col.type': 'Type',
    'history.col.action': 'Action',
    'history.col.date': 'Date / time',
    'history.col.responder': 'Responder',
    'history.empty': 'No alerts yet. Trigger one above to see it here.',
    'history.action.ongoing': 'Ongoing',
    'history.action.resolved': 'Resolved',
    'history.rangeArrow': '{from} → {to}',

    'trigger.title.default': 'Trigger Alert',
    'trigger.title.critical': 'Trigger Critical Alert',
    'trigger.title.warning': 'Trigger Warning Alert',
    'trigger.subtitle': 'Choose who receives this page',
    'trigger.targetAll': 'All subscribers',
    'trigger.cancel': 'Cancel',
    'trigger.button': 'Trigger → {summary}',
    'trigger.summary.everyone': 'everyone',
    'trigger.summary.selected': '{n} selected',
    'trigger.failed': 'Trigger failed: {error}',

    'detail.section.acknowledged': 'Acknowledged',
    'detail.section.pending': 'Pending',
    'detail.section.declined': 'Declined',
    'detail.field.triggered': 'Triggered',
    'detail.field.resolved': 'Resolved',
    'detail.field.responder': 'Responder',
    'detail.nobodyYet': 'Nobody yet',
    'detail.resolve': 'Resolve alert',
    'detail.close': 'Close',
    'detail.resolveFailed': 'Resolve failed: {error}',

    'targetLabel.all': 'All subscribers',
    'targetLabel.none': 'No recipients',
    'empty.dash': '—',

    'subscribers.backToDashboard': '← Dashboard',
    'subscribers.eyebrow': 'Hark admin',
    'subscribers.title': 'Subscribers',
    'subscribers.countActive': 'Active',
    'subscribers.countInvited': 'Invited',
    'subscribers.description': 'Devices registered to receive on-call pages',
    'subscribers.inviteButton': 'Invite New User',
    'subscribers.col.subscriber': 'Subscriber / device',
    'subscribers.col.status': 'Status',
    'subscribers.col.lastActivity': 'Last activity',
    'subscribers.col.actions': 'Actions',
    'subscribers.status.active': 'Active',
    'subscribers.status.invited': 'Invited',
    'subscribers.device.awaiting': 'Awaiting device',
    'subscribers.empty': 'No subscribers yet. Tap "Invite New User" to add one.',
    'subscribers.actions.testPing': 'Test Ping',
    'subscribers.actions.reinvite': 'Re-invite',
    'subscribers.actions.kick': 'Kick',
    'subscribers.lastActivity.never': 'Never connected',
    'subscribers.testPing.sent': 'Test ping sent to {n} device(s).',
    'subscribers.testPing.failed': 'Test ping failed: {error}',
    'subscribers.reinvite.failed': 'Re-invite failed: {error}',
    'subscribers.kick.confirm': 'Kick this subscriber? Their devices lose access immediately.',
    'subscribers.kick.failed': 'Kick failed: {error}',

    'invite.cardTitle': 'Temporary join link',
    'invite.urlLabel': 'Invite URL',
    'invite.copy': 'Copy link',
    'invite.done': 'Done',
    'invite.qrAlt': 'Invite QR code',
    'invite.modal.title': 'Invite new user',
    'invite.modal.subtitle': 'Give this subscriber a display name so responders can tell devices apart.',
    'invite.modal.displayNameLabel': 'Display name',
    'invite.modal.displayNamePlaceholder': 'e.g. Jordan Marsh',
    'invite.modal.create': 'Create invite',
    'invite.modal.cancel': 'Cancel',
    'invite.failed': 'Invite failed: {error}',

    'time.today': 'Today · {time}',
    'time.yesterday': 'Yesterday · {time}',
    'time.absolute': '{date} · {time}',
  },
};

function pickLocale(available) {
  const langs = (navigator.languages && navigator.languages.length
    ? navigator.languages
    : [navigator.language || 'en']);
  for (const raw of langs) {
    const tag = String(raw).toLowerCase();
    if (available.includes(tag)) return tag;
    const primary = tag.split('-')[0];
    if (available.includes(primary)) return primary;
  }
  return 'en';
}

const activeLocale = pickLocale(Object.keys(catalogs));

function t(key, args) {
  const dict = catalogs[activeLocale] || catalogs.en;
  const template = dict[key] ?? catalogs.en[key] ?? key;
  if (!args) return template;
  return template.replace(/\{(\w+)\}/g, (_, name) =>
    args[name] !== undefined ? String(args[name]) : `{${name}}`);
}

// Walk the DOM once at load and replace every `data-i18n` element with its
// translated text. `data-i18n-attr="attr:key,attr:key"` handles placeholders,
// alt text, and other attributes. `data-i18n-title` sets document.title.
function applyStaticI18n(root = document) {
  root.querySelectorAll('[data-i18n]').forEach((el) => {
    el.textContent = t(el.dataset.i18n);
  });
  root.querySelectorAll('[data-i18n-attr]').forEach((el) => {
    for (const pair of el.dataset.i18nAttr.split(',')) {
      const [attr, key] = pair.split(':').map(s => s.trim());
      if (attr && key) el.setAttribute(attr, t(key));
    }
  });
  root.querySelectorAll('[data-i18n-title]').forEach((el) => {
    document.title = t(el.dataset.i18nTitle);
  });
}

document.addEventListener('DOMContentLoaded', () => applyStaticI18n());

// --- fetch helper ---------------------------------------------------------

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

function escapeHtml(s) {
  return String(s ?? '').replace(/[&<>"']/g, (c) => ({
    '&':'&amp;', '<':'&lt;', '>':'&gt;', '"':'&quot;', "'":'&#39;',
  }[c]));
}

function fmtTime(iso) {
  if (!iso) return t('empty.dash');
  const d = new Date(iso);
  const today = new Date(); today.setHours(0, 0, 0, 0);
  const yesterday = new Date(today); yesterday.setDate(today.getDate() - 1);
  const dayStart = new Date(d); dayStart.setHours(0, 0, 0, 0);
  const time = d.toLocaleTimeString('en-GB', {
    hour: '2-digit', minute: '2-digit', second: '2-digit', timeZone: 'UTC',
  }) + ' UTC';
  if (dayStart.getTime() === today.getTime())     return t('time.today', { time });
  if (dayStart.getTime() === yesterday.getTime()) return t('time.yesterday', { time });
  return t('time.absolute', { date: d.toISOString().slice(0, 10), time });
}

/// Turn "Jordan Marsh" → "JM"; "Acme" → "AC"; empty → "·".
function initialsOf(name) {
  const parts = String(name ?? '').split(/\s+/).filter(Boolean);
  if (parts.length === 0) return '·';
  if (parts.length === 1) return parts[0].slice(0, 2).toUpperCase();
  return (parts[0][0] + parts[1][0]).toUpperCase();
}

function lastActivity(iso) {
  if (!iso) return t('subscribers.lastActivity.never');
  return fmtTime(iso);
}
