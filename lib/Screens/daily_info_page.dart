import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huangjui/Etc/color_for_app.dart';

class Info_Page extends StatefulWidget {
  const Info_Page({Key? key}) : super(key: key);

  @override
  State<Info_Page> createState() => _Info_PageState();
}

class _Info_PageState extends State<Info_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'ฮวงจุ้ยประจำวัน',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
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
        body: Stack(
          children: <Widget>[
            Image.asset('assets/images/background_half.jpg',
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                fit: BoxFit.fill),
            Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 215, 190, 138),
                                    width: 5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Color.fromARGB(255, 255, 244, 220),
                              ),
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/images/badge-background.svg',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ราศีบน',
                                          style: TextStyle(
                                              color: theRed,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'ถ่ายเท',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '(พิฆาตติถี พลังเดียวกัน)',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                            'ดาวอำนาจฝ่ายบู๊ เกี่ยวกับเรื่องตำแหน่ง ยศศักดิ์ การสอบแข่งขัน เลือกตั้งจะทำให้มีจิตใจแบบนักเลง คือยึดถือสัจจะพูดจาขวานผ่า ซาก ตรงประเด็นไม่อ้อมค้อม ถ้าติถีมีกำลังจะเป็นขุนนาง ฝ่ายบู๊ปราบอิทธิพลถ้าติถีอ่อนแอมากจะถูกผู้ใหญ่ข่มเหง'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 35,
                      child: CircleAvatar(
                        radius: 43,
                        backgroundColor: Color.fromARGB(255, 215, 190, 138),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(8), // Border radius
                            child: Column(
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
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Stack(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 215, 190, 138),
                                    width: 5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Color.fromARGB(255, 255, 244, 220),
                              ),
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/images/badge-background.svg',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ราศีล่าง',
                                          style: TextStyle(
                                              color: theRed,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'โชคลาภ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '(พิฆาตติถี พลังเดียวกัน)',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        const Text(
                                            'ดาวอำนาจฝ่ายบู๊ เกี่ยวกับเรื่องตำแหน่ง ยศศักดิ์ การสอบแข่งขัน เลือกตั้งจะทำให้มีจิตใจแบบนักเลง คือยึดถือสัจจะพูดจาขวานผ่า ซาก ตรงประเด็นไม่อ้อมค้อม ถ้าติถีมีกำลังจะเป็นขุนนาง ฝ่ายบู๊ปราบอิทธิพลถ้าติถีอ่อนแอมากจะถูกผู้ใหญ่ข่มเหง'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 35,
                      child: CircleAvatar(
                        radius: 43,
                        backgroundColor: Color.fromARGB(255, 215, 190, 138),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(8), // Border radius
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/zodiac & elements/marong.svg',
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'มะโรง',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 242, 153, 74)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
