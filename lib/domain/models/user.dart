import "dart:typed_data";

import "package:easthardware_pms/domain/enums/enums.dart";
import "package:uuid/uuid.dart";

class User {
  final int id;
  final String uid;
  final String firstName;
  final String lastName;
  final String username;
  final AccessLevel accessLevel;
  final Uint8List salt;
  final Uint8List passwordHash;

  User({
    String? uid,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.accessLevel,
    required this.passwordHash,
    required this.salt,
  }) : uid = uid ?? const Uuid().v4();

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? username,
    AccessLevel? accessLevel,
    Uint8List? passwordHash,
    Uint8List? salt,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      accessLevel: accessLevel ?? this.accessLevel,
      passwordHash: passwordHash ?? this.passwordHash,
      salt: salt ?? this.salt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'access_level': accessLevel.index,
      'password_hash': passwordHash,
      'salt': salt,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      username: map['username'] as String,
      accessLevel: AccessLevel.values[map['access_level'] as int],
      passwordHash: map['password_hash'] as Uint8List,
      salt: map['salt'] as Uint8List,
    );
  }
}
