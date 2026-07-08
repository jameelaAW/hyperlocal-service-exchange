# Intelligence Layer

## Messy Inputs
Owner types free-form listing descriptions: "my neighbor's old couch, barely used, needs gone by Friday"

## Auto-Structure (later)
```json
{
  "detected_category": "giveaways",
  "suggested_tags": ["furniture", "free", "urgent"],
  "urgency_signal": true,
  "source": "gpt-4o-mini",
  "confidence": 0.87,
  "review_status": "unreviewed"
}
```

## Events to Track
- `listing.created`, `listing.published`, `listing.edited`, `listing.deleted`
- `board.viewed` (anonymous, count only)
- `listing.contact_revealed` (if contact is toggled visible)

## Scoring Rules (rule-based v1)
- Recency: published within 7 days → boosted
- Category match: filter selected → exact match first
- No ML needed until 50+ listings

## What Gets Ranked
- Public board listing order: newest-published first (v1); scored relevance later

## v1 vs Later
**v1:** manual category, manual tags, newest-first sort
**Later:** AI auto-category suggestion (low-risk, owner reviews before publish), urgency detection, tag cloud