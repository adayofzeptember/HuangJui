import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huangjui/Login%20&%20Register/login_page.dart';
import 'package:huangjui/Login%20&%20Register/register_page.dart';
import 'package:huangjui/daily_info_page.dart';
import 'package:huangjui/main_Calendar.dart';
import 'package:huangjui/Etc/theMainColor.dart';
import 'package:huangjui/profile.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(Start_Page_HuangJui()));
}

class Start_Page_HuangJui extends StatelessWidget {
  const Start_Page_HuangJui({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Kanit',
        primarySwatch: Palette.thisRed,
        appBarTheme: AppBarTheme(color: Palette.thisRed),
      ),
      home: AppBackground(),
    );
  }
}

class AppBackground extends StatefulWidget {
  AppBackground({Key? key}) : super(key: key);
  @override
  State<AppBackground> createState() => _AppBackgroundState();
}

class _AppBackgroundState extends State<AppBackground> {
  @override
  initState() {
    _Load_And_Go();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    systemOverlayStyle:
    SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        statusBarColor: Palette.thisRed);
    super.initState();
  }

  Future _Load_And_Go() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Main_Calendar(),
        ),
      );
    });
  }

  // _Load_And_Go() {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => Main_Calendar(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                _Load_And_Go();
              },
              child: SvgPicture.asset(
                'assets/images/start.svg',
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}