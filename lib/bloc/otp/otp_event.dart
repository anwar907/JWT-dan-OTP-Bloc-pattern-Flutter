import 'package:equatable/equatable.dart';

class OtpEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class OtpStartEvent extends OtpEvent {}

class OtpButtonPressed extends OtpEvent {
  final String email;
  final String code;
  OtpButtonPressed({this.email, this.code});
}
