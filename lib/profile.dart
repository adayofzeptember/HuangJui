import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huangjui/Etc/color_for_app.dart';
import 'package:huangjui/api/get_profile.dart';
import 'package:huangjui/main.dart';
import 'package:restart_app/restart_app.dart';
import 'api/google_auth.dart';
import 'api/put_register_form.dart';

String profile_edit_name = '';
String profile_edit_surename = '';

final formKey_profile_edit_form = GlobalKey<FormState>();
late Provider_registerForm _provider_profileForm;
var _profile_nameController = TextEditingController();
var _profile_surenameController = TextEditingController();

class Profile extends StatefulWidget {
  String? name;
  String? ipic;

  Profile({Key? key, this.name, this.ipic}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //!late Future<User_Profile> future_Profile;
  @override
  void initState() {
    //!future_Profile = fetch_profile_ByID(13);
    _provider_profileForm = Provider_registerForm();
    super.initState();
  }

  String radioButtonItem = 'ONE';
  int id = 1;
  String x = '';
  bool checkMothaFukka = false;
  late MediaQueryData queryData = MediaQuery.of(context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theRed,
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              Text(
                'โปรไฟล์',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text('')
            ],
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: theRed),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: theRed,
      ),
      body: 
          SingleChildScrollView(
            child: Center(
              child: Form(
                key: formKey_profile_edit_form,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5),
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(widget.ipic.toString()),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.name.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: FittedBox(
                            fit: BoxFit.none,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/crown.svg',
                                  height: 12,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Premium Member',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 143, 97, 1)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 221, 99),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15,10,15,10),
                      child: Wrap(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 40, left: 40, right: 80),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ชื่อ-นามสกุล',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 143, 143, 143)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        checkMothaFukka
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.05,
                                                      width: 100,
                                                      child: TextFormField(
                                                        controller:
                                                            _profile_nameController,
                                                        autofocus: true,
                                                        validator: (value) {
                                                          if (value!.isEmpty) {}
                                                          return null;
                                                        },
                                                        keyboardType:
                                                            TextInputType.text,
                                                        onSaved: (input) {
                                                          profile_edit_name =
                                                              input.toString();
                                                          print(input.toString());
                                                        },
                                                        textInputAction:
                                                            TextInputAction.done,
                                                        decoration:
                                                            const InputDecoration(
                                                          counterText: "",
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                          hintStyle: TextStyle(
                                                              color:
                                                                  Color.fromARGB(
                                                                      255,
                                                                      212,
                                                                      212,
                                                                      212)),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius
                                                                        .circular(
                                                                            10.0)),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius
                                                                        .circular(
                                                                            10.0)),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Palette
                                                                        .thisRed,
                                                                    width: 1),
                                                          ),
                                                        ),
                                                      )),
                                                  VerticalDivider(width: 10),
                                                  SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.05,
                                                      width: 135,
                                                      child: TextFormField(
                                                        controller:
                                                            _profile_surenameController,
                                                        validator: (value) {
                                                          if (value!.isEmpty) {}
                                                          return null;
                                                        },
                                                        keyboardType:
                                                            TextInputType.name,
                                                        onSaved: (input) {
                                                          profile_edit_surename =
                                                              input.toString();
                                                          print(input.toString());
                                                        },
                                                        textInputAction:
                                                            TextInputAction.done,
                                                        decoration:
                                                            const InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                          hintStyle: TextStyle(
                                                              color:
                                                                  Color.fromARGB(
                                                                      255,
                                                                      212,
                                                                      212,
                                                                      212)),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius
                                                                        .circular(
                                                                            10.0)),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius
                                                                        .circular(
                                                                            10.0)),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Palette
                                                                        .thisRed,
                                                                    width: 1),
                                                          ),
                                                        ),
                                                      )),
                                                  const VerticalDivider(width: 5),
                                                ],
                                              )
                                            : Text(
                                                widget.name.toString(),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 34, 43, 69)),
                                              ),
                                        SizedBox(height: 20),
                                        Text(
                                          'เพศ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 143, 143, 143)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        checkMothaFukka
                                            ? Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: [
                                                      Radio(
                                                        value: 1,
                                                        groupValue: id,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            radioButtonItem =
                                                                'ONE';
                                                            id = 1;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'ไม่ระบุ',
                                                        style: new TextStyle(
                                                            fontSize: 17.0),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Radio(
                                                        value: 2,
                                                        groupValue: id,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            radioButtonItem =
                                                                'TWO';
                                                            id = 2;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'หญิง',
                                                        style: new TextStyle(
                                                          fontSize: 17.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Radio(
                                                        value: 3,
                                                        groupValue: id,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            radioButtonItem =
                                                                'THREE';
                                                            id = 3;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'ชาย',
                                                        style: new TextStyle(
                                                            fontSize: 17.0),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : Text(
                                                'ชาย',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 34, 43, 69)),
                                              ),
                                        SizedBox(height: 20),
                                        Text(
                                          'วัน เดือน ปีเกิด',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 143, 143, 143)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '22 กันยายน 2555',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 34, 43, 69)),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'เวลาเกิด',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 143, 143, 143)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '05 : 00 น.',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 34, 43, 69)),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          'ธาตุประจำตัว',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 143, 143, 143)),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/images/zodiac & elements/fire.svg',
                                              height: 30,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'ธาตุไฟ +',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 235, 87, 87)),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 160,
                                        child: checkMothaFukka
                                            ? ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    primary: theRed,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    )),
                                                onPressed: () {
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                  if (formKey_profile_edit_form
                                                      .currentState!
                                                      .validate()) {
                                                    formKey_profile_edit_form
                                                        .currentState
                                                        ?.save();
                                                    setState(() {
                                                      _provider_profileForm
                                                              .email =
                                                          'mailtest@fsdgm.com';
          
                                                      _provider_profileForm.name =
                                                          profile_edit_name
                                                                  .toString() +
                                                              " " +
                                                              profile_edit_surename
                                                                  .toString();
                                                    });
                                                    put_register_form(
                                                        _provider_profileForm,
                                                        13.toString());
                                                  }
                                                  setState(() {
                                                    checkMothaFukka =
                                                        !checkMothaFukka;
                                                  });
                                                },
                                                child: const Padding(
                                                    padding: EdgeInsets.all(10.0),
                                                    child: Text(
                                                      "บันทึก",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255, 255, 255, 255),
                                                          fontSize: 15),
                                                    )),
                                              )
                                            : ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    primary: theRed,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    )),
                                                onPressed: () {
                                                  setState(() {
                                                    checkMothaFukka =
                                                        !checkMothaFukka;
                                                  });
                                                },
                                                child: const Padding(
                                                    padding: EdgeInsets.all(10.0),
                                                    child: Text(
                                                      "แก้ไขโปรไฟล์",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255, 255, 255, 255),
                                                          fontSize: 15),
                                                    )),
                                              ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      checkMothaFukka
                                          ? SizedBox(
                                              //* แถบขาวโปรไฟล์
                                              width: 160,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    primary: Color.fromARGB(
                                                        255, 215, 190, 138),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    )),
                                                onPressed: () {
                                                  setState(() {
                                                    checkMothaFukka =
                                                        !checkMothaFukka;
                                                  });
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Text(
                                                    "ยกเลิก",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: theRed,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : SizedBox(
                                              //* แถบขาวโปรไฟล์
                                              width: 160,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    primary: Color.fromARGB(
                                                        255, 215, 190, 138),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    )),
                                                onPressed: () {
                                                  GoogoleSignInApi
                                                      .google_LogOut();
                                                  FacebookAuth.instance.logOut();
                                                  Restart.restartApp();
                                                  //exit(0);
                             
                                                  // Navigator.pushReplacement(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //       builder: (context) =>
                                                  //           Start_Page_HuangJui()),
                                                  // );
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Text(
                                                    "ออกจากระบบ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: theRed,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ),
                                            ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
        
      
    
  }
}
