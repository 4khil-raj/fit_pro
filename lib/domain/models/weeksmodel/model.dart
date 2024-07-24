class WeekModel {
  final String id;
  final int week;
  final List<String> days;
  final DateTime createdAt;
  final DateTime updatedAt;

  WeekModel({
    required this.id,
    required this.week,
    required this.days,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WeekModel.fromJson(Map<String, dynamic> json) {
    return WeekModel(
      id: json['_id'],
      week: json['week'],
      days: List<String>.from(json['days']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'week': week,
      'days': days,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
