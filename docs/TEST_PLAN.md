# Test Plan

## v1 Success Scenario (manual)
1. Visit the live URL — public board loads with seed listings. **Pass:** cards visible, no login prompt.
2. Click "Giveaways" filter tab — only giveaway seed row shows. **Pass:** other categories hidden.
3. Click a listing card — detail page shows full description and contact snippet. **Pass:** no 404.
4. Visit `/admin` without the cookie — redirected to `/admin/login`. **Pass:** dashboard not accessible.
5. Enter correct `ADMIN_SECRET` — redirected to `/admin` dashboard. **Pass:** listing table shown.
6. Create new listing "Free bicycle — good condition", category Giveaways, add contact snippet, click Save. **Pass:** row appears in dashboard with status Draft.
7. Click Publish — status changes to Published. **Pass:** row appears on public board at `/`.
8. Edit the listing — change description. **Pass:** public board reflects updated text.
9. Unpublish — listing disappears from `/`. **Pass:** still visible in owner dashboard as Draft.
10. Delete listing with confirmation — listing removed from dashboard and DB. **Pass:** no orphan row.

## Empty & Error States
- Delete all listings → public board shows "No listings yet" empty-state message.
- Submit create form with no title → inline validation error, no DB write.
- Supabase offline / slow → board shows error banner, not a blank screen.
- Wrong `ADMIN_SECRET` entered → stays on login page with error message.

## Photo Upload
- Upload a JPEG on create form → photo_url stored; thumbnail visible on card; full image on detail page.
- Skip photo → card renders without image, no broken-image icon.