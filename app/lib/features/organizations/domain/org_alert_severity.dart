/// Relevance of the org's active alerts to the current user.
///
/// * [forMe] — I'm a recipient of at least one active alert. Shown in the
///   destructive accent color.
/// * [forOther] — active alerts exist but none of them target me. Shown in
///   the advisory accent so I still get a cue that something is firing.
/// * [none] — no active alert triggers a highlight.
enum OrgAlertSeverity { none, forOther, forMe }
