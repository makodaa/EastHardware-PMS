part of 'user_log_list_bloc.dart';

class UserLogListState extends Equatable {
  final List<UserLog> userlogs;
  final List<UserLog> filteredLogs;
  final DataStatus status;
  const UserLogListState({
    this.userlogs = const [],
    this.filteredLogs = const [],
    this.status = DataStatus.initial,
  });

  @override
  List<Object> get props => [userlogs, filteredLogs, status];

  UserLogListState copyWith({
    List<UserLog>? userlogs,
    List<UserLog>? filteredLogs,
    DataStatus? status,
  }) {
    return UserLogListState(
      userlogs: userlogs ?? this.userlogs,
      filteredLogs: filteredLogs ?? this.filteredLogs,
      status: status ?? this.status,
    );
  }
}
