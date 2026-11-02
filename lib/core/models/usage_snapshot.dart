class UsageSnapshot {
  const UsageSnapshot({
    required this.packageName,
    required this.foregroundDuration,
    required this.capturedAt,
  });

  final String packageName;
  final Duration foregroundDuration;
  final DateTime capturedAt;
}
