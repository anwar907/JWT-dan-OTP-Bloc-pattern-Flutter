import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class StartEvent extends AuthEvent {}

class LoginButtonPressed extends AuthEvent {
  final String email;
  final String password;
  LoginButtonPressed({
    this.email,
    this.password,
  });
}
