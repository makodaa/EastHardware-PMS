class UserLog {
  final int id;
  final int userId;
  final String event;
  final DateTime eventTime;
  UserLog({
    required this.id,
    required this.userId,
    required this.event,
    required this.eventTime,
  });

  factory UserLog.fromMap(Map<String, dynamic> map) {
    return UserLog(
      id: map['id'],
      userId: map['user_id'],
      event: map['event'],
      eventTime: DateTime.parse(map['event_time']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'event': event,
      'event_time': eventTime.toIso8601String(),
    };
  }
}
