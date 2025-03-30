import "dart:typed_data";

enum AccessLevel {
  staff,
  administrator,
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final AccessLevel accessLevel;
  final Uint8List passwordHash;
  final Uint8List salt;

  User(
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.accessLevel,
    this.passwordHash,
    this.salt,
  );

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
      id ?? this.id,
      firstName ?? this.firstName,
      lastName ?? this.lastName,
      username ?? this.username,
      accessLevel ?? this.accessLevel,
      passwordHash ?? this.passwordHash,
      salt ?? this.salt,
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
      map['id'] as int,
      map['first_name'] as String,
      map['last_name'] as String,
      map['username'] as String,
      AccessLevel.values[map['access_level'] as int],
      Uint8List.fromList(map['password_hash'] as List<int>),
      Uint8List.fromList(map['salt'] as List<int>),
    );
  }
}
