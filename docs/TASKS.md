# Tasks & Sprints

## Sprint 1 — Data Foundation & Public Board ✦ v1 functional milestone begins
**Goal:** Database live, seed data visible to any visitor — the real product, not a placeholder.
- [ ] Create `listings` table + RLS v1 permissive policies via migration SQL
- [ ] Seed 4 realistic demo listings (2 repairs, 1 giveaway, 1 community help)
- [ ] Build public board page (`/`) — listing cards with category badge, title, description snippet, contact snippet
- [ ] Category filter tabs (All | Repairs | Giveaways | Community Help)
- [ ] Handle loading, empty, error, and populated states on board
- [ ] Deploy to Vercel; confirm live URL renders seed data

**Definition of Done:** Visiting the live URL shows the 4 seed listings; filtering by "Giveaways" shows only that seed row; an empty filter result shows the empty-state message.

---

## Sprint 2 — Owner Dashboard & Core CRUD ✦ v1 functional milestone completes
**Goal:** Owner can create, edit, publish, and delete listings end-to-end.
- [ ] `/admin` route: check `ADMIN_SECRET` cookie; redirect to `/admin/login` if missing
- [ ] Simple login page that sets the cookie on correct secret entry
- [ ] Dashboard listing table: title, category, status, edit/delete actions
- [ ] Create listing form: title, description, category, contact snippet, photo upload
- [ ] Edit listing form (pre-populated)
- [ ] Publish / Unpublish toggle
- [ ] Delete with confirmation dialog
- [ ] `audit_logs` insert on every create / update / delete / publish
- [ ] All form states: loading, validation error, success

**Definition of Done:** Owner creates "Free bicycle", publishes it, visitor sees it on `/`; owner unpublishes it, it disappears from public board; delete removes it; all actions logged in `audit_logs`.

---

## Sprint 3 — Polish & Custom Domain
**Goal:** Site is presentable and live on owner's domain.
- [ ] Responsive layout — mobile card grid for public board
- [ ] Listing detail page (`/listings/[id]`) with full description + photo
- [ ] Photo display on cards (thumbnail) and detail page
- [ ] SEO meta tags (title, description) per listing
- [ ] Custom domain configured in Vercel
- [ ] Favicon + site name in nav

**Definition of Done:** Site loads on custom domain; listing detail page shows full content + photo; mobile layout is usable.

---

## Sprint 4 — Lock It Down (auth + RLS)
**Goal:** Owner has a real account; data is owner-scoped; demo rows remain visible.
- [ ] Enable Supabase Auth; owner signs up with email
- [ ] Replace `ADMIN_SECRET` cookie gate with Supabase session
- [ ] Set `user_id` on all existing listings to owner's `auth.uid()`
- [ ] Replace v1 permissive RLS with: SELECT allows `status='published'` OR `user_id = auth.uid()`; writes require `user_id = auth.uid()`
- [ ] Confirm demo seed rows still visible publicly after RLS change

**Definition of Done:** Owner logs in via Supabase Auth; only owner can edit/delete; public visitors still see published listings; a logged-out user cannot reach `/admin`.

---

## Gantt (sprint → deliverable)
```
Week 1: Sprint 1 (DB + public board live)
Week 1: Sprint 2 (owner CRUD — v1 functional milestone ✦)
Week 2: Sprint 3 (polish + custom domain)
Week 2: Sprint 4 (lock it down)
```