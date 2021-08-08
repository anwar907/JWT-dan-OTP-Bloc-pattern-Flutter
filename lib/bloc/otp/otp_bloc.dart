import 'package:app_bloc/bloc/otp/otp_event.dart';
import 'package:app_bloc/bloc/otp/otp_state.dart';
import 'package:app_bloc/repository/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  AuthRepository verfi;
  OtpBloc(OtpState initialState, this.verfi) : super(initialState);

  @override
  Stream<OtpState> mapEventToState(OtpEvent event) async* {
    var pref = await SharedPreferences.getInstance();
    print("DATA YG DISIMPAN >> ${pref.getString('token')}");
    if (event is OtpStartEvent) {
      yield OtpInitState();
    } else if (event is OtpButtonPressed) {
      yield OtpLoadingState();
      var verfication = await verfi.otp(event.email, event.code);
      verfication.toString();
      print("VERFIKASI DATA >> $verfication");
      if (verfication != null) {
        pref.setString('token', verfication['token']);
        yield OtpSuccessState();
      } else {
        yield OtpErrorState(message: "Code OTP Error");
      }
    }
  }
}
