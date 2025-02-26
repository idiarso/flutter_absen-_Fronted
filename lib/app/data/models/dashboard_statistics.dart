class DashboardStatistics {
  final int totalAttendance;
  final int totalLate;
  final int totalAbsent;
  final double attendanceRate;

  DashboardStatistics({
    required this.totalAttendance,
    required this.totalLate,
    required this.totalAbsent,
    required this.attendanceRate,
  });

  factory DashboardStatistics.fromJson(Map<String, dynamic> json) {
    return DashboardStatistics(
      totalAttendance: json['total_attendance'] as int,
      totalLate: json['total_late'] as int,
      totalAbsent: json['total_absent'] as int,
      attendanceRate: (json['attendance_rate'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'total_attendance': totalAttendance,
    'total_late': totalLate,
    'total_absent': totalAbsent,
    'attendance_rate': attendanceRate,
  };
}