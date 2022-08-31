import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huangjui/Etc/theMainColor.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
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
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: Palette.thisRed),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Palette.thisRed,
      ),
      body: SingleChildScrollView(
          primary: false,
          child: Stack(
            children: [
              SvgPicture.asset('assets/images/Background.svg',
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 1,
                  fit: BoxFit.cover),
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
                            image: AssetImage(
                              'assets/images/for Mock Up Only/kurt.jpeg',
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Drain You',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
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
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 221, 99),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                    SizedBox(height: 30),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        height: MediaQuery.of(context).size.height * 1,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50, left: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'ชื่อ-นามสกุล',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 143, 143, 143)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Drain You',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 34, 43, 69)),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'เพศ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 143, 143, 143)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'หญิง',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 34, 43, 69)),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'วัน เดือน ปีเกิด',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 143, 143, 143)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '22 กันยายน 2555',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 34, 43, 69)),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'เวลาเกิด',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 143, 143, 143)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '05 : 00 น.',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 34, 43, 69)),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'ธาตุประจำตัว',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 143, 143, 143)),
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
                                        color:
                                            Color.fromARGB(255, 235, 87, 87)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
