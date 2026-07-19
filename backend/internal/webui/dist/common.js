// Hark admin — shared helpers used by both dashboard.js and subscribers.js.

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
  if (!iso) return '—';
  const d = new Date(iso);
  const today = new Date(); today.setHours(0, 0, 0, 0);
  const yesterday = new Date(today); yesterday.setDate(today.getDate() - 1);
  const dayStart = new Date(d); dayStart.setHours(0, 0, 0, 0);
  const time = d.toLocaleTimeString('en-GB', {
    hour: '2-digit', minute: '2-digit', second: '2-digit', timeZone: 'UTC',
  }) + ' UTC';
  if (dayStart.getTime() === today.getTime())     return `Today · ${time}`;
  if (dayStart.getTime() === yesterday.getTime()) return `Yesterday · ${time}`;
  return `${d.toISOString().slice(0, 10)} · ${time}`;
}

/// Turn "Jordan Marsh" → "JM"; "Acme" → "AC"; empty → "·".
function initialsOf(name) {
  const parts = String(name ?? '').split(/\s+/).filter(Boolean);
  if (parts.length === 0) return '·';
  if (parts.length === 1) return parts[0].slice(0, 2).toUpperCase();
  return (parts[0][0] + parts[1][0]).toUpperCase();
}

/// Coarse relative time — "Today · 14:22 UTC", "Yesterday · …", "3 days ago".
function lastActivity(iso) {
  if (!iso) return 'Never connected';
  return fmtTime(iso);
}
