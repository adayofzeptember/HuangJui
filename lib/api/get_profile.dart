import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:huangjui/api/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Get_Profile {
  String? message;
  User? user;

  Get_Profile({this.message, this.user});

  Get_Profile.fromJson(Map<String, dynamic> json) {
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
  String? status;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.phone,
      this.avatar,
      this.status,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    avatar = json['avatar'];
    status = json['status'];
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
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

Future<User> fetch_profile_ByID(var userID) async {
  String url = wanhengURL + "profile/" + userID.toString();
  final response = await http.get(Uri.parse(url),
      headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'});

  var jsonResponse = json.decode(response.body);
  var jsonCon = jsonResponse['user'];
  String testgetID = jsonResponse['user']['id'].toString();
  User profileData = User.fromJson(jsonCon);
  print(jsonResponse);
  print(testgetID.toString());
  return profileData;
}

void main() {
  fetch_profile_ByID(13);
}