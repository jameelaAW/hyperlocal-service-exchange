# Architecture

## Stack
- **Frontend + API routes:** Next.js 14 (App Router) on Vercel
- **Database + storage:** Supabase (Postgres + RLS + Storage for photos)
- **Auth:** env-var `ADMIN_SECRET` checked in a Next.js API route — no Supabase auth in v1

## Now vs Later (feature terms)
**Now:** public listing board, owner CRUD dashboard, category filter, contact snippet, photo upload
**Later:** visitor contact form, owner login via Supabase Auth, per-listing analytics, AI auto-tagging

## Key Action Flow — Owner Publishes a Listing
1. Owner submits the listing form (title, description, category, contact, optional photo)
2. API route verifies `ADMIN_SECRET` cookie
3. Photo (if any) uploaded to Supabase Storage; public URL stored
4. Row inserted into `listings` table with `status = 'draft'`
5. Owner clicks Publish → API route sets `status = 'published'`
6. Public board queries `listings where status = 'published'` — row appears immediately
7. Visitor sees the listing; no login required

## Layer Plan
1. **Data first** — `listings` table + RLS policies + seed rows
2. **App logic** — CRUD API routes + public board + owner dashboard
3. **Smart features later** — AI tag suggestions, ranking, contact-form routing

## Core Without AI
All listing creation, publishing, and display is plain Postgres + Next.js. AI is additive only.