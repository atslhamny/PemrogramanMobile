class Clock {
  final String? id;
  final String? userId;
  final String? checkClockType;
  final String? checkClockTime;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? deletedAt;

  Clock({
    this.id,
    this.userId,
    this.checkClockType,
    this.checkClockTime,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'check_clock_type': checkClockType,
    'check_clock_time': checkClockTime,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'deleted_at': deletedAt,
  };

  factory Clock.fromRow(dynamic row) {
    return Clock(
      id: row['id'],
      userId: row['user_id'],
      checkClockType: row['check_clock_type'],
      checkClockTime: row['check_clock_time']?.toString(),
      createdAt: row['created_at'],
      updatedAt: row['updated_at'],
      deletedAt: row['deleted_at'],
    );
  }
}
