import 'package:app_bloc/bloc/auth_bloc.dart';
import 'package:app_bloc/bloc/auth_event.dart';
import 'package:app_bloc/bloc/auth_state.dart';
import 'package:app_bloc/ui/post_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginUi extends StatefulWidget {
  @override
  _LoginUiState createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthBloc authBloc;

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final logo = Center(
      child: Icon(
        Icons.supervised_user_circle,
        size: 150,
      ),
    );
    final msg = BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is LoginErrorState) {
        return Text(state.message);
      } else if (state is LoginLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container();
      }
    });

    final username = TextField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          filled: true,
          fillColor: Colors.grey,
          hintStyle: TextStyle(color: Colors.white),
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final pass = TextField(
      controller: password,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          filled: true,
          fillColor: Colors.grey,
          hintStyle: TextStyle(color: Colors.white),
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          authBloc
            ..add(
                LoginButtonPressed(email: email.text, password: password.text));

          // print("DATA EMAIL >>${email.text}");
          // print("DATA PASSWORD >>${password.text}");
        },
        child: Text("Log In"),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.amber)),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UserLoginSuccessState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Contact(
                          email: email.text,
                        )));
            // pushPage(
            //     context,
            //     BlocProvider.value(
            //       value: BlocProvider.of<AuthBloc>(context),
            //       child: Contact(email: email.text),
            //     ));
          }
        },
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24, right: 24),
            children: [
              logo,
              SizedBox(
                height: 20.0,
              ),
              msg,
              SizedBox(
                height: 20.0,
              ),
              username,
              SizedBox(
                height: 20.0,
              ),
              pass,
              SizedBox(
                height: 20.0,
              ),
              loginButton
            ],
          ),
        ),
      ),
    );
  }
}
