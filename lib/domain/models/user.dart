import "dart:typed_data";

enum AccessLevel {
  staff,
  administrator,
}

class User {
  final int id;
  final String first_name;
  final String last_name;
  final String username;
  final AccessLevel access_level;
  final Uint8List password_hash;
  final Uint8List salt;

  User(
    this.id,
    this.first_name,
    this.last_name,
    this.username,
    this.access_level,
    this.password_hash,
    this.salt,
  );

  User copyWith({
    int? id,
    String? first_name,
    String? last_name,
    String? username,
    AccessLevel? access_level,
    Uint8List? password_hash,
    Uint8List? salt,
  }) {
    return User(
      id ?? this.id,
      first_name ?? this.first_name,
      last_name ?? this.last_name,
      username ?? this.username,
      access_level ?? this.access_level,
      password_hash ?? this.password_hash,
      salt ?? this.salt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'username': username,
      'access_level': access_level.index,
      'password_hash': password_hash,
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
