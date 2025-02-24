class MonthlyProgress {
  final String month;
  final double progress;
  final int totalDays;
  final int completedDays;

  MonthlyProgress({
    required this.month,
    required this.progress,
    required this.totalDays,
    required this.completedDays,
  });

  factory MonthlyProgress.fromJson(Map<String, dynamic> json) => MonthlyProgress(
        month: json['month'],
        progress: json['progress'].toDouble(),
        totalDays: json['total_days'],
        completedDays: json['completed_days'],
      );

  Map<String, dynamic> toJson() => {
        'month': month,
        'progress': progress,
        'total_days': totalDays,
        'completed_days': completedDays,
      };
}
