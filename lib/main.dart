import 'package:app_bloc/bloc/auth_bloc.dart';
import 'package:app_bloc/bloc/auth_state.dart';
import 'package:app_bloc/bloc/otp/otp_bloc.dart';
import 'package:app_bloc/bloc/otp/otp_state.dart';
import 'package:app_bloc/repository/auth_repo.dart';
import 'package:app_bloc/ui/login.dart';
import 'package:app_bloc/ui/post_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(Auth());
}

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc(LoginInitState(), AuthRepository())),
        BlocProvider(
            create: (context) => OtpBloc(OtpInitState(), AuthRepository()))
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => LoginUi(),
          '/contact': (context) => Contact(),
          '/addContact': (context) => Contact()
        },
      ),
    );
  }
}
