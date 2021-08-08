import 'package:app_bloc/bloc/auth_event.dart';
import 'package:app_bloc/bloc/auth_state.dart';
import 'package:app_bloc/repository/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository repo;
  AuthBloc(AuthState initialState, this.repo) : super(initialState);

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    // var pref = await SharedPreferences.getInstance();
    if (event is StartEvent) {
      yield LoginInitState();
    } else if (event is LoginButtonPressed) {
      yield LoginLoadingState();
      print("EVENT EMAIL >>${event.email}");
      print("EVENT PASSWORD >>${event.password}");
      var data = await repo.login(event.email, event.password);

      print("DATA MASUK >> $data");
      if (data != null) {
        yield UserLoginSuccessState();
      } else {
        yield LoginErrorState(message: "Auth error");
      }
    }
  }
}
