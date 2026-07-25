# Hark

Zero-context, high-certainty on-call paging.

## Why Hark exists

### The problem: the anti-pattern of on-call paging

In most modern engineering teams, incident alerting heavily relies on instant messaging platforms like Slack or Microsoft Teams using `@here` or `@mention` tags. While convenient, this practice introduces critical vulnerabilities and operational friction:

1. **The noise & alert fatigue.** Slack is cluttered with non-urgent day-to-day chats, thread updates, and memes. During off-hours, on-call engineers either suffer from severe alert fatigue or mute the app entirely, causing them to completely miss high-priority production incidents.
2. **The "too big to fail" security risk.** Enterprise communication apps carry immense context — sensitive logs, internal architectural details, and credentials. Giving an engineer's personal mobile device persistent access to this data creates a massive security liability. If a device is lost or compromised, the blast radius is enormous. However, enforcing short session timeouts often leads to the worst-case scenario: an engineer being silently logged out without noticing, leaving them unreachable during a critical outage.

### The solution: zero-context, high-certainty alerting

Hark decouples the *act of paging* from the *act of debugging*. The system does not care *why* the system is down, nor does it contain any textual context, logs, or sensitive infrastructure data. It has one singular focus: **waking up the right person at the right time with maximum certainty.**

By stripping away all context, we achieve two major breakthroughs:

- **Zero-trust mobile security.** Even if a device running this app is physically stolen or compromised, the attacker gains absolutely zero information about your company's infrastructure, code, or incident history.
- **Uncompromised reliability.** Because the app is incredibly lightweight and data-blind, we can aggressively utilize native OS privileges (such as iOS Critical Alerts and Android High-Priority Channels) to bypass silent modes and DND, ensuring the alert cuts through the noise without consuming excessive battery or breaching user privacy.

Hark is built for teams who value absolute security, high-fidelity alerting, and the peace of mind that comes with complete operational isolation.

## Repository layout

```
app/       Flutter client (iOS + Android)
backend/   Go server, SQLite storage, FCM dispatcher, subscriber web UI
web/       Static assets served by the backend
mise.toml  Pinned toolchain (Go 1.23, Flutter 3.44.6)
```

## Global development setup

Install the pinned toolchains and enable the repository's pre-push secret scan:

```sh
mise install
mise run hooks-install
```

## Component guides

- [Flutter app setup and mobile-link configuration](app/README.md)
- [Backend setup, deployment, and configuration](backend/README.md)
- [Cloudflare Tunnel for local mobile testing](backend/cloudflared/README.md)
