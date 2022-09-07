import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huangjui/Login%20&%20Register/register_1_page.dart';
import 'package:huangjui/daily_info_page.dart';
import 'package:huangjui/main_Calendar.dart';
import 'package:huangjui/Etc/color_for_app.dart';
import 'package:huangjui/profile.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';
import '../api/google_auth.dart';

class Compass_Page extends StatefulWidget {
  Compass_Page({Key? key}) : super(key: key);

  @override
  State<Compass_Page> createState() => _Compass_PageState();
}

class _Compass_PageState extends State<Compass_Page> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Center(
          child: SmoothCompass(
            rotationSpeed: 200,
            height: 300,
            width: 300,
            compassAsset: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/loading.jpg'),
                      fit: BoxFit.cover)),
            ),
            compassBuilder: (context, AsyncSnapshot<CompassModel>? compassData,
                Widget compassAsset) {
              return compassAsset;
            },
          ),
        ),
      ],
    ));
  }
}
