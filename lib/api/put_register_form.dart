import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:huangjui/Login%20&%20Register/register_3_from.dart';
import 'package:huangjui/api/api_url.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main_Calendar.dart';

class Register_Form {
  String? message;
  User? user;

  Register_Form({this.message, this.user});

  Register_Form.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? avatar;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.phone,
      this.avatar,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    avatar = json['avatar'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Provider_registerForm {
  String? email;
  String? name;

  Provider_registerForm({this.email, this.name});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    return data;
  }
}

Future<Register_Form> put_register_form(
    Provider_registerForm provider_form, String userID) async {
  String url = wanhengURL + 'profile/update/' + userID.toString();
  var body_form = json.encode(provider_form.toJson());
  final response = await http.put(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: body_form,
  );
  var jsonRes = json.decode(response.body);
  print(jsonRes);
  if (response.statusCode == 400 ||
      response.statusCode >= 200 && response.statusCode <= 299) {
    var jsonRes = json.decode(response.body);

    print('update success');
    return Register_Form.fromJson(json.decode(response.body));
  } else {
    throw Exception("error");
  }
}
