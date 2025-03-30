import 'package:easthardware_pms/data/repository/authentication_repository.dart';
import 'package:easthardware_pms/presentation/bloc/authentication/authentication/authentication_bloc.dart';
import 'package:easthardware_pms/presentation/bloc/authentication/loginform/login_form_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

class DependencyInjector {
  late AuthenticationRepositoryImpl _authenticationRepository;

  Future<void> init() async {
    _authenticationRepository = AuthenticationRepositoryImpl();
  }

  List<SingleChildWidget> inject() {
    return [
      BlocProvider(
          create: (context) => AuthenticationBloc(_authenticationRepository)),
      BlocProvider(create: (context) => LoginFormBloc()),
    ];
  }
}
