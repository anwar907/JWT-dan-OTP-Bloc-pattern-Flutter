import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRepository {
  login(String email, String password) async {
    var body = {"identity": email, "password": password};
    // print("DATA DARI API >>> $body");
    var res = await http.post(Uri.parse("IP/user/login"),
        headers: {"Content-Type": "application/json"}, body: json.encode(body));
    final data = json.decode(res.body);
    // print("DATA DARI REST >>> $data");
    if (data['message'] ==
        "success, check your email to get code verification") {
      return data;
    } else {
      return "auth problem";
    }
  }

  otp(String email, String codeSms) async {
    var body = {"identity": email, "code": codeSms};
    var res = await http.post(
        Uri.parse("IP/user/login/verification"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body));
    final data = json.decode(res.body);
    print("ADA DATA TOKEN >> $data");
    print("ADA DATA TOKEN >> ${res.statusCode}");
    return data;
  }
}
