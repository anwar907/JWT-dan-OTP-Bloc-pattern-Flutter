import 'package:app_bloc/bloc/otp/otp_bloc.dart';
import 'package:app_bloc/bloc/otp/otp_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Contact extends StatefulWidget {
  final String email;
  Contact({this.email});
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController code = TextEditingController();

  OtpBloc otpBloc;

  @override
  void initState() {
    otpBloc = BlocProvider.of<OtpBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pass = TextField(
      controller: code,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          filled: true,
          fillColor: Colors.grey,
          hintStyle: TextStyle(color: Colors.white),
          hintText: 'OTP',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Code OTP"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
        child: Container(
          child: Center(
            child: Column(
              children: [
                pass,
                ElevatedButton(
                    onPressed: () {
                      otpBloc.add(OtpButtonPressed(
                          email: widget.email, code: code.text));
                      print("DATA EMAIL >>${widget.email}");
                      print("DATA CODE >>${code.text}");
                    },
                    child: Text("Verfication"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
