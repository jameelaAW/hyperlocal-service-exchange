create table if not exists listings (
  id uuid primary key default gen_random_uuid(),
  user_id uuid,
  title text not null,
  description text,
  category text not null default 'community_help',
  status text not null default 'draft',
  contact_snippet text,
  photo_url text,
  ai_tags text[],
  ai_tags_source text,
  ai_tags_confidence numeric,
  ai_tags_review_status text default 'unreviewed',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table listings enable row level security;

drop policy if exists "listings_v1_read" on listings;
create policy "listings_v1_read" on listings for select using (true);

drop policy if exists "listings_v1_write" on listings;
create policy "listings_v1_write" on listings for all using (true) with check (true);

create table if not exists audit_logs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid,
  listing_id uuid,
  action text not null,
  risk_level text,
  payload_snapshot jsonb,
  approved_by text,
  created_at timestamptz not null default now()
);

alter table audit_logs enable row level security;

drop policy if exists "audit_logs_v1_read" on audit_logs;
create policy "audit_logs_v1_read" on audit_logs for select using (true);

drop policy if exists "audit_logs_v1_write" on audit_logs;
create policy "audit_logs_v1_write" on audit_logs for all using (true) with check (true);

insert into listings (title, description, category, status, contact_snippet, photo_url) values
  ('Leaky tap repair — happy to help', 'I can fix leaky taps and basic plumbing for neighbors. Just bring your own washers if possible. Free of charge, just good karma.', 'repairs', 'published', 'Text Maria on 555-0192', null),
  ('Fence painting this weekend', 'Offering to help paint fences or garden walls. I have brushes and rollers. Split the paint cost and I supply the labour.', 'repairs', 'published', 'Knock on 14 Elm Street or email dan@neighborhood.local', null),
  ('Free sofa — must collect by Sunday', 'Three-seater fabric sofa in good condition. Light grey, no major stains. You must be able to collect — I cannot deliver. First come first served.', 'giveaways', 'published', 'Call or text 555-0147 after 6 pm', null),
  ('Street clean-up this Saturday 10am', 'Organising a short neighbourhood tidy-up around the park. Bring gloves and a bag. Coffee and snacks provided afterwards at the community centre.', 'community_help', 'published', 'Email hello@elmstreet.local to sign up', null);