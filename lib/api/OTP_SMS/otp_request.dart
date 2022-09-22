import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:huangjui/Login%20&%20Register/login_page.dart';

class OTP_Request_Response {
  String? status;
  String? token;
  String? refno;

  OTP_Request_Response({this.status, this.token, this.refno});

  OTP_Request_Response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    refno = json['refno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['token'] = token;
    data['refno'] = refno;
    return data;
  }
}

class OTP_Request_Provider {
  String? key;
  String? secret;
  String? msisdn;

  OTP_Request_Provider({this.key, this.secret, this.msisdn});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['secret'] = secret;
    data['msisdn'] = msisdn;
    return data;
  }
}

Future<OTP_Request_Response> send_otp_request(
    OTP_Request_Provider otpRequestModel) async {
  String urlPost = "https://otp.thaibulksms.com/v2/otp/request";

  var bodyOtp = json.encode(otpRequestModel.toJson());

  final response = await http.post(
    Uri.parse(urlPost),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      "key": otpRequestModel.key,
      "secret": otpRequestModel.secret,
      "msisdn": otpRequestModel.msisdn
    },
  );
  var jsonRes = json.decode(response.body);
  print('body..........' + bodyOtp);
  print('jsonResponse........' + jsonRes.toString());

  if (response.statusCode == 400 || response.statusCode == 200) {
    return OTP_Request_Response.fromJson(json.decode(response.body));
  } else {
    throw Exception("error");
  }
}
