class RecentActivity {
  final String title;
  final String description;
  final DateTime timestamp;
  final bool success;

  RecentActivity({
    required this.title,
    required this.description,
    required this.timestamp,
    required this.success,
  });

  factory RecentActivity.fromJson(Map<String, dynamic> json) {
    return RecentActivity(
      title: json['title'] as String,
      description: json['description'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      success: json['success'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'timestamp': timestamp.toIso8601String(),
    'success': success,
  };
}