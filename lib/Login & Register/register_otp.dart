import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huangjui/Etc/color_for_app.dart';
import 'package:huangjui/Login%20&%20Register/login_page.dart';
import 'package:huangjui/Login%20&%20Register/register_from.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class Register_Page_OTP extends StatefulWidget {
  Register_Page_OTP({Key? key}) : super(key: key);

  @override
  State<Register_Page_OTP> createState() => _Register_Page_OTPState();
}

class _Register_Page_OTPState extends State<Register_Page_OTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
           Image.asset('assets/images/background_full.jpg',
              alignment: Alignment.center,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text('ลงทะเบียนด้วยเบอร์โทรศัพท์',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: theRed)),
                              ),
                              SizedBox(
                                height: 120,
                              ),
                              Text(
                                'ป้อนรหัส OTP ที่ได้รับทาง SMS เพื่อยืนยันตัวตน',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              OTPTextField(
                                  otpFieldStyle: OtpFieldStyle(
                                      backgroundColor: Colors.white,
                                      focusBorderColor: Palette.thisRed),
                                  length: 5,
                                  width: MediaQuery.of(context).size.width,
                                  textFieldAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  fieldWidth: 45,
                                  fieldStyle: FieldStyle.box,
                                  outlineBorderRadius: 5,
                                  style: TextStyle(fontSize: 17),
                                  onChanged: (pin) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Register_Form(),
                                      ),
                                    );
                                    print("Changed: " + pin);
                                  },
                                  onCompleted: (pin) {
                                    print("Completed: " + pin);
                                  }),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  print('resend this shit man.');
                                },
                                child: SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.refresh_outlined),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          'ส่งอีกครั้ง',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                height: 100,
                              ),

                              // AbsorbPointer(
                              //   absorbing: true, // by default is true
                              //   child: ElevatedButton(
                              //     onPressed: () {
                              //       print(
                              //           'pending to implement onPressed function');
                              //     },
                              //     child: Text("Button Click!!!"),
                              //   ),
                              // ),
                            ],
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
