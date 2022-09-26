import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:huangjui/api/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register_Login_Social {
  String? message;
  User? user;
  String? accessToken;

  Register_Login_Social({this.message, this.user, this.accessToken});

  Register_Login_Social.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['accessToken'] = this.accessToken;
    return data;
  }
}

class User {
  String? status;
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? avatar;
  String? updatedAt;
  String? createdAt;

  User(
      {this.status,
      this.id,
      this.name,
      this.email,
      this.password,
      this.phone,
      this.avatar,
      this.updatedAt,
      this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    avatar = json['avatar'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Request_Social_Provider {
  String? name;
  String? email;
  String? avatar;

  Request_Social_Provider({
    this.name,
    this.email,
    this.avatar,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    return data;
  }
}

Future<Register_Login_Social> login_Social(
    Request_Social_Provider request_social_provider) async {
  String urlPost = wanhengURL + 'register-social';
  var bodySocial = json.encode(request_social_provider.toJson());
  final response = await http.post(
    Uri.parse(urlPost),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    },
    body: bodySocial,
  );

  var jsonRes = json.decode(response.body);
  var token = jsonRes['accessToken'];
  // String id_toStore2 = jsonRes['data']['id'].toString();
  print(jsonRes);
  print(token);

  if (response.statusCode == 200 || response.statusCode == 201) {
    return Register_Login_Social.fromJson(json.decode(response.body));
  } else {
    throw Exception("error");
  }
}
