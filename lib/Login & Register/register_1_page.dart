import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huangjui/Etc/color_for_app.dart';
import 'package:huangjui/Login%20&%20Register/login_page.dart';
import 'package:huangjui/Login%20&%20Register/register_2_otp.dart';
import 'package:huangjui/api/OTP_SMS/otp_request.dart';
import 'package:huangjui/main_Calendar.dart';
import '../api/google_auth.dart';

var phoneNumber_Controller = TextEditingController();
String? k;
String? a;
String? b;

class Register_Page extends StatefulWidget {
  Register_Page({Key? key}) : super(key: key);

  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  late OTP_Request_Provider otp_provider_model;
  @override
  void initState() {
    super.initState();
    otp_provider_model = OTP_Request_Provider();
  }

  Future<dynamic> useGoogle_toLogin() async {
    final userGoogle = await GoogoleSignInApi.google_SignIn2();
    GoogoleSignInApi.google_SignIn2().then((result) {
      result!.authentication.then((googleKey) {
        print("id----------------> " + userGoogle!.id.toString());
        print("access token ------------------> " +
            googleKey.accessToken.toString());
        print("เมล ------------------> " + userGoogle.email.toString());
        print("ชื่อ -------------------> " + userGoogle.displayName.toString());
        print("รูป ------------------> " + userGoogle.photoUrl.toString());
        setState(() {
          a = userGoogle.displayName.toString();
          b = userGoogle.photoUrl.toString();
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Main_Calendar(
              name: a,
              ipic: b,
            ),
          ),
        );
      }).catchError((error1) {
        print('error in');
      });
    }).catchError((error2) {
      print('error out');
    });
  }

  final formKey_phoneNumber = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset('assets/images/background_full.jpg',
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
              fit: BoxFit.fill),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      'ปฏิทินฮวงจุ้ย',
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 215, 190, 138)),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromARGB(255, 255, 239, 224),
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 25.0, 30, 50),
                          child: Form(
                            key: formKey_phoneNumber,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text('ลงทะเบียน',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: theRed)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'ลงทะเบียนด้วยเบอร์โทรศัพท์',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    width: double.infinity,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "กรุณากรอกหมายเลขเบอร์มือถือ";
                                        }
                                      },
                                      controller: phoneNumber_Controller,
                                      maxLength: 10,
                                      keyboardType: TextInputType.number,
                                      onSaved: (input) {
                                        k = input.toString();
                                        otp_provider_model.key =
                                            '1743122628803977';
                                        otp_provider_model.secret =
                                            'fe2b8dc85833369fad71662c34db2149';
                                        otp_provider_model.msisdn =
                                            input.toString();
                                      },
                                      textInputAction: TextInputAction.done,
                                      decoration: InputDecoration(
                                        counterText: "",
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'กรอกเบอร์โทรศัพท์',
                                        hintStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 212, 212, 212)),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 230, 228, 228),
                                              width: 0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 0),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            side: BorderSide(color: theRed),
                                            primary: Color.fromARGB(
                                                255, 255, 239, 224),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )),
                                        onPressed: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) =>
                                          //         Login_Page(),
                                          //   ),
                                          // );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Container(
                                            width: double.infinity,
                                            alignment: Alignment.center,
                                            child: Text(
                                              "เข้าสู่ระบบ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: theRed,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    VerticalDivider(width: 5),
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            side: BorderSide(color: theRed),
                                            primary: theRed,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )),
                                        onPressed: () {
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();

                                          if (formKey_phoneNumber.currentState!
                                              .validate()) {
                                            formKey_phoneNumber.currentState
                                                ?.save();

                                            send_otp_request(
                                                otp_provider_model);
                                            // print(jsonEncode(otp_provider_model));

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Register_Page_OTP(),
                                              ),
                                            );
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Container(
                                            width: double.infinity,
                                            alignment: Alignment.center,
                                            child: Text(
                                              "ต่อไป",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Center(
                                    child: Text(
                                  'หรือ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                                SizedBox(
                                  height: 15,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      // side: BorderSide(color: Palette.kToDark),
                                      primary:
                                          Color.fromARGB(255, 24, 119, 242),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/facebook-icon.svg'),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "ลงทะเบียน Facebook",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      side: BorderSide(
                                          color: Color.fromARGB(
                                              255, 223, 223, 223)),
                                      primary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  onPressed: () {
                                    useGoogle_toLogin();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/google-icon.svg'),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "ลงทะเบียนด้วย Google",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      // side: BorderSide(color: Palette.kToDark),
                                      primary: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  onPressed: () {
                                    GoogoleSignInApi.google_LogOut();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/apple-icon.svg'),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "ลงทะเบียนด้วย Apple",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Container(
              //   width:250,
              //   height: 250,
              //   color: Colors.white,
              // )
            ],
          ),
        ],
      ),
    );
  }
}
