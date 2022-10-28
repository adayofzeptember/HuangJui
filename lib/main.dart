import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:huangjui/Etc/color_for_app.dart';
import 'package:huangjui/Login%20&%20Register/login_page.dart';
import 'package:huangjui/Login%20&%20Register/register_1_page.dart';
import 'package:huangjui/Login%20&%20Register/register_3_from.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(Start_Page_HuangJui()));
}

class Start_Page_HuangJui extends StatelessWidget {
  const Start_Page_HuangJui({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ((context, child) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, child!),
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(900, name: MOBILE),
              const ResponsiveBreakpoint.resize(1000, name: MOBILE),
              const ResponsiveBreakpoint.resize(1200, name: TABLET),
            ],
          )),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('th', 'TH'),
      ],
      theme: ThemeData(
        fontFamily: 'Kanit',
        primarySwatch: theRed,
      ),
      home: AppBackground(),
    );
  }
}

class AppBackground extends StatefulWidget {
  const AppBackground({Key? key}) : super(key: key);
  @override
  State<AppBackground> createState() => _AppBackgroundState();
}

class _AppBackgroundState extends State<AppBackground> {
  @override
  initState() {
    _Load_And_Go();
    super.initState();
  }

  Future _Load_And_Go() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageTransition(
          duration: Duration(milliseconds: 250),
          type: PageTransitionType.rightToLeft,
          child: Login_Page(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                _Load_And_Go();
              },
              child: Image.asset(
                'assets/images/loading.jpg',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
