import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    data['refno'] = this.refno;
    return data;
  }
}

class OTP_Request_Provider {
  String? key;
  String? secret;
  String? msisdn;

  OTP_Request_Provider({this.key, this.secret, this.msisdn});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['secret'] = this.secret;
    data['msisdn'] = this.msisdn;

    return data;
  }
}

Future<OTP_Request_Response> send_otp_request(
    OTP_Request_Provider otp_RequestModel) async {
  String urlPost = "https://otp.thaibulksms.com/v2/otp/request";

  var body_otp = json.encode(otp_RequestModel.toJson());
  final response = await http.post(
    Uri.parse(urlPost),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      "key": otp_RequestModel.key,
      "secret": otp_RequestModel.secret,
      "msisdn": otp_RequestModel.msisdn
    },
  );

  print('body..........'+body_otp);
  var jsonRes = json.decode(response.body);
  print('jsonres........'+jsonRes.toString());

  if (response.statusCode == 400 || response.statusCode == 200) {
    return OTP_Request_Response.fromJson(json.decode(response.body));
  } else {
    throw Exception("error");
  }
}
