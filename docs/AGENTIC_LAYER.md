# Agentic Layer

## Risk Levels & Actions

### Low — Auto (no approval needed)
- Suggest category from description text
- Generate a short summary blurb from description
- Flag listing as possibly duplicate (surface warning only)

### Medium — Owner approves before applying
- Auto-set `status = 'published'` based on a publish schedule
- Suggest an updated contact snippet if email format detected

### High — Always needs explicit owner approval
- Send a contact notification to owner's email when visitor submits inquiry

### Critical — Human only
- Delete a listing permanently
- Expose private contact details beyond the snippet

## Named Tools (v1 approved set)
- `suggest_category(description: string) → category`
- `generate_summary(description: string) → blurb`
- `flag_duplicate(title: string) → boolean`

## Audit Log Fields
`id, listing_id, action, performed_by, risk_level, payload_snapshot, approved_by, created_at`

## v1 vs Later
**v1:** no agentic actions run automatically — all are manual owner actions
**Later:** low-risk auto-suggestions surfaced in dashboard; medium actions with one-click approve