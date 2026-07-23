/// Severity of the most relevant active alert for a connected org.
///
/// * [critical] — an active critical alert that targets the current user.
/// * [warning] — an active warning alert that targets the current user, or
///   any active critical alert (even one that doesn't target the current
///   user). The user still deserves a visible cue that something is firing.
/// * [none] — no active alert triggers a highlight.
enum OrgAlertSeverity { none, warning, critical }
