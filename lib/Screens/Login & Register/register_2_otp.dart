import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:huangjui/Etc/color_for_app.dart';

class Register_Page_OTP extends StatefulWidget {
  const Register_Page_OTP({Key? key}) : super(key: key);

  @override
  State<Register_Page_OTP> createState() => _Register_Page_OTPState();
}

class _Register_Page_OTPState extends State<Register_Page_OTP> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.thisRed,
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
                    // Text(
                    //   'ปฏิทินฮวงจุ้ย',
                    //   style: TextStyle(
                    //       fontSize: 45,
                    //       fontWeight: FontWeight.bold,
                    //       color: Color.fromARGB(255, 215, 190, 138)),
                    // ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        decoration: const BoxDecoration(
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
                              const SizedBox(
                                height: 100,
                              ),
                              const Text(
                                'ป้อนรหัส OTP ที่ได้รับทาง SMS เพื่อยืนยันตัวตน',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              OtpTextField(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                focusedBorderColor: Palette.thisRed,
                                numberOfFields: 5,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                fieldWidth: 50,
                                borderWidth: 1,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                enabledBorderColor: Colors.grey,
                                borderColor: Palette.thisRed,
                                showFieldAsBox: true,
                                onCodeChanged: (String code) {},

                                onSubmit: (String verificationCode) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("รหัส"),
                                          content: Text(verificationCode),
                                        );
                                      });
                                }, 
                              ),
                              const SizedBox(
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
                                      children: const [
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
                              const SizedBox(
                                height: 80,
                              ),
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
