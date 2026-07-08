# Security

## Secret Handling
- `ADMIN_SECRET` stored in Vercel env vars — never in client bundle or source code
- Supabase service-role key used only in server-side API routes, never in browser
- `NEXT_PUBLIC_SUPABASE_ANON_KEY` is the only key safe for the client

## Permission Model (v1)
- Public board: anonymous read of `status='published'` listings — no auth required
- Owner dashboard: API routes check `Authorization: Bearer $ADMIN_SECRET` on every mutating request
- Lock-down sprint: replace env-var gate with Supabase Auth + RLS `user_id = auth.uid()` policies

## Approved-Tools Rule
- Only the three named tools in AGENTIC_LAYER.md may be called by any automated step
- No `run_any`, `exec`, or open-ended LLM tool calls permitted
- Every tool call is logged to `audit_logs` before the result is applied

## Audit Principle
- Every create / update / delete on `listings` writes a row to `audit_logs` with action, listing_id, and timestamp
- Logs are append-only; no UI delete for audit rows
- If uncertain about a security change (RLS, key rotation, data exposure): stop and get a human reviewer