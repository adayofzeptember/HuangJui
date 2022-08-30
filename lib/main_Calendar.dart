import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huangjui/Etc/theMainColor.dart';
import 'package:huangjui/info_check.dart';

class Main_Calendar extends StatefulWidget {
  Main_Calendar({Key? key}) : super(key: key);

  @override
  State<Main_Calendar> createState() => _Main_CalendarState();
}

class _Main_CalendarState extends State<Main_Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            'ปฏิทินฮวงจุ้ย',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color.fromARGB(215, 190, 138, 1)),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: Palette.thisRed),
        backgroundColor: Palette.thisRed,
      ),
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Info_Page(),
            ),
          );
        },
        child: Stack(
          children: <Widget>[
            SvgPicture.asset('assets/images/Background.svg',
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                fit: BoxFit.fill),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 243, 243, 243)),
                          color: Color.fromARGB(255, 243, 243, 243),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  child: Icon(
                                    Icons.person,
                                    color: Palette.thisRed,
                                  ),
                                  backgroundColor:
                                      Color.fromARGB(255, 245, 227, 66),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'มีเงิน ร่ำรวย',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/crown.svg',
                                                height: 8,
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                'premium member',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 143, 97, 1)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)))),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/zodiac & elements/fire.svg',
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'ธาตุไฟ +',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 235, 87, 87)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 243, 243, 243)),
                            color: Color.fromARGB(255, 243, 243, 243),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        width: double.infinity,
                        child: SvgPicture.asset('assets/images/cal.svg'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
