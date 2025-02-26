class DashboardSummary {
  final String title;
  final String description;
  final Map<String, dynamic> data;
  final bool success;

  DashboardSummary({
    required this.title,
    required this.description,
    required this.data,
    required this.success,
  });

  factory DashboardSummary.fromJson(Map<String, dynamic> json) {
    return DashboardSummary(
      title: json['title'] as String,
      description: json['description'] as String,
      data: json['data'] as Map<String, dynamic>,
      success: json['success'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'data': data,
    'success': success,
  };
}