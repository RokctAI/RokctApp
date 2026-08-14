# RokctApp

RokctApp is being rebuilt as a productivity app shell for small business owners, built on the RokctAI fleet pattern: a Flutter shell composed from fleet SDKs at build time via The-Rokct-Protocol composer.

## Status

This repo was wiped of its legacy Foodyman-fork code in this PR. The app scope is being defined — direction discussion is in progress. A fresh Flutter shell will be scaffolded on the fleet pattern with a pinned composer manifest.

## Layout

- `composer/` — composer variant templates (including `supacharge.json`) and their README
- `docs/` — architecture docs (core SDK shared database, offline-first implementation guide, SDK indirect communication, original SDK implementation plan, handoff notes)
- `.rokct/` — protocol bootstrap (`compose.py`), project memory, decision log, and workspace sync scripts
