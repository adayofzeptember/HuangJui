import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huangjui/Etc/color_for_app.dart';
import 'package:huangjui/main.dart';
import 'api/google_auth.dart';

class Profile extends StatefulWidget {
  String? name;
  String? ipic;
  Profile({Key? key, this.name, this.ipic}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late MediaQueryData queryData = MediaQuery.of(context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            Text(
              'โปรไฟล์',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text('')
          ],
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: theRed),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: theRed,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/background_half.jpg',
                width: queryData.size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                fit: BoxFit.fill),
            Center(
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
                          image: NetworkImage(widget.ipic.toString())

                          // AssetImage(
                          //   'assets/images/for Mock Up Only/kurt.jpeg',
                          // )
                          ,
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 15),
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
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  SizedBox(height: 30),
                  Wrap(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          height: MediaQuery.of(context).size.height * 0.6425,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 40, left: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    Text(
                                      widget.name.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 34, 43, 69)),
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
                                    Text(
                                      'ชาย',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 34, 43, 69)),
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
                                          color:
                                              Color.fromARGB(255, 34, 43, 69)),
                                    ),
                                    SizedBox(height: 20),
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
                                          color:
                                              Color.fromARGB(255, 34, 43, 69)),
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
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text(
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
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: theRed,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          )),
                                      onPressed: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          "แก้ไขโปรไฟล์",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    //* แถบขาวโปรไฟล์
                                    width: 160,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: Color.fromARGB(
                                              255, 215, 190, 138),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          )),
                                      onPressed: () {
                                        GoogoleSignInApi.google_LogOut();
                                        FacebookAuth.instance.logOut();
                                        // if (Platform.isAndroid) {
                                        //   SystemNavigator.pop();
                                        // } else if (Platform.isIOS) {
                                        //   exit(0);
                                        // }
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Start_Page_HuangJui()),
                                        );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          "ออกจากระบบ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: theRed,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container()
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
