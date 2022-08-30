import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huangjui/theColor.dart';

class Login_Page extends StatefulWidget {
  Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SvgPicture.asset('assets/images/Background.svg',
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
                          color: Color.fromARGB(215, 190, 138, 1)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color.fromARGB(255, 245, 219, 219),
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 40, 30, 55),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text('สมัครสมาชิก',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Palette.thisRed)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('ลงทะเบียนด้วยเบอร์โทรศัพท์'),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.057,
                                  width: double.infinity,
                                  child: TextField(
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        print("input something.");
                                      } else {
                                        print(value);
                                      }
                                    },
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
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
                                          side: BorderSide(
                                              color: Palette.thisRed),
                                          primary: Color.fromARGB(
                                              255, 245, 219, 219),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          )),
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Container(
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "เข้าสู่ระบบ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Palette.thisRed,
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
                                          side: BorderSide(
                                              color: Palette.thisRed),
                                          primary: Palette.thisRed,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          )),
                                      onPressed: () {},
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
                              Center(child: Text('หรือ')),
                              SizedBox(
                                height: 15,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    // side: BorderSide(color: Palette.kToDark),
                                    primary: Color.fromARGB(255, 24, 119, 242),
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
                                            "ลงทะเบียนด้วย Facebook",
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
                                    // side: BorderSide(color: Palette.kToDark),
                                    primary: Colors.white,
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
