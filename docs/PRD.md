# PRD — Hyperlocal Service Exchange

## Problem
Neighbors have no lightweight, owner-controlled place to advertise skills, give things away, or ask for community help without relying on third-party platforms.

## Target User
One owner (the builder) who publishes and manages all listings; neighbors visit and browse anonymously.

## Core Objects
- **Listing** — a single post: repair offer, giveaway, or community help request
- **Category** — Repairs | Giveaways | Community Help
- **Contact Snippet** — owner-defined contact info shown on published listings

## MVP Must-Haves
- [ ] Owner can create, edit, publish, and delete a Listing
- [ ] Listing has: title, description, category, status (draft/published), contact snippet, photo (optional)
- [ ] Public board shows all published listings; visitors need no account
- [ ] Owner dashboard protected by a single admin password (env-var gate, no user table yet)
- [ ] Empty state, loading state, and error state handled on the public board
- [ ] Site runs on a custom domain via Vercel

## Non-Goals (v1)
- Visitor accounts or messaging
- Very personal or sensitive requests
- Multi-owner / team access
- Payment or rating systems
- AI categorization (manual only in v1)

## Success Criteria
**Pass:** Owner logs into the dashboard, creates a "Free bicycle — good condition" giveaway listing, publishes it, and a neighbor visiting the public URL sees it in the Giveaways section with the contact snippet — without creating an account.