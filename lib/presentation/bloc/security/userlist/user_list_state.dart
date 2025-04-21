part of 'user_list_bloc.dart';

class UserListState extends Equatable {
  final List<User> users;
  final DataStatus status;

  const UserListState({
    this.users = const [],
    this.status = DataStatus.initial,
  });

  UserListState copyWith({
    List<User>? users,
    DataStatus? status,
  }) {
    return UserListState(
      users: users ?? this.users,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [users, status];
}
