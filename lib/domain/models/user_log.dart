import 'package:uuid/uuid.dart';

class UserLog {
  final int? id;
  final String uid;
  final int userId;
  final String event;
  final DateTime eventTime;
  UserLog({
    String? uid,
    this.id,
    required this.userId,
    required this.event,
    required this.eventTime,
  }) : uid = uid ?? const Uuid().v4();

  factory UserLog.fromMap(Map<String, dynamic> map) {
    return UserLog(
      id: map['id'],
      uid: map['uid'],
      userId: map['user_id'],
      event: map['event'],
      eventTime: DateTime.parse(map['event_time']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'user_id': userId,
      'event': event,
      'event_time': eventTime.toIso8601String(),
    };
  }
}
