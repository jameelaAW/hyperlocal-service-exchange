# Data Model

## listings
| Field | Type | Notes |
|---|---|---|
| id | uuid PK | gen_random_uuid() |
| user_id | uuid nullable | owner-scoping at lock-down sprint |
| title | text not null | e.g. "Free bicycle" |
| description | text | full details |
| category | text not null | 'repairs' \| 'giveaways' \| 'community_help' |
| status | text not null default 'draft' | 'draft' \| 'published' |
| contact_snippet | text | phone, email, or note shown on card |
| photo_url | text nullable | Supabase Storage public URL |
| ai_tags | text[] | AI-suggested tags (later) |
| ai_tags_source | text | model + prompt version |
| ai_tags_confidence | numeric | 0–1 |
| ai_tags_review_status | text default 'unreviewed' | 'unreviewed'\|'accepted'\|'rejected' |
| created_at | timestamptz not null default now() | |
| updated_at | timestamptz not null default now() | |

## RLS
- RLS enabled on `listings`
- v1 permissive policies: anyone can SELECT published rows; all writes open (locked down later)
- Lock-down sprint: SELECT `status='published'` or `user_id = auth.uid()`; writes require `auth.uid() = user_id`

## Relationships
- No foreign keys in v1 — category is a text enum; contact snippet is inline on the listing
- `user_id` added nullable now; FK to `auth.users` added at lock-down sprint