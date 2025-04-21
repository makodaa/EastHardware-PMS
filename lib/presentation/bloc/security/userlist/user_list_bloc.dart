import 'package:bloc/bloc.dart';
import 'package:easthardware_pms/data/repository/user_repository.dart';
import 'package:easthardware_pms/domain/enums/enums.dart';
import 'package:easthardware_pms/domain/models/user.dart';
import 'package:equatable/equatable.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc(this._repository) : super(const UserListState()) {
    on<LoadAllUsersEvent>(_onLoadUsers);
    on<AddUserEvent>(_onAddUser);
    on<UpdateUserEvent>(_onUpdateUser);
    on<DeleteUserEevnt>(_onDeleteUser);
  }
  final UserRepositoryImpl _repository;

  void _onLoadUsers(LoadAllUsersEvent event, Emitter<UserListState> emit) async {
    try {
      emit(state.copyWith(users: await _repository.getAllUsers()));
    } catch (e) {
      print('Error loading users $e');
      emit(state.copyWith(status: DataStatus.error));
    }
  }

  void _onAddUser(AddUserEvent event, Emitter<UserListState> emit) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      final insertedUser = await _repository.insertUser(event.user);

      final users = List<User>.from(state.users)..add(insertedUser);
      emit(state.copyWith(users: users, status: DataStatus.success));
    } catch (e) {
      print('Error adding user $e');
      emit(state.copyWith(status: DataStatus.error));
    }
  }

  void _onUpdateUser(UpdateUserEvent event, Emitter<UserListState> emit) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      final updatedUser = await _repository.updateUser(event.user);

      final updatedUsers = List<User>.from(state.users);
      final index = updatedUsers.indexWhere((user) => user.id == updatedUser.id);
      if (index != -1) {
        updatedUsers[index] = updatedUser;
      }

      emit(state.copyWith(users: updatedUsers, status: DataStatus.success));
    } catch (e) {
      print('Error updating user $e');
      emit(state.copyWith(status: DataStatus.error));
    }
  }

  void _onDeleteUser(DeleteUserEevnt event, Emitter<UserListState> emit) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      await _repository.deleteUser(event.user);
      final updatedUsers =
          List<User>.from(state.users).where((user) => user.id != event.user.id).toList();
      emit(state.copyWith(users: updatedUsers, status: DataStatus.success));
    } catch (e) {
      print('Error deleting user $e');
      emit(state.copyWith(status: DataStatus.error));
    }
  }
}
