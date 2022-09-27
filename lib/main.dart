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
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('th', 'TH'),
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

  Future<void> _Load_And_Go() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        PageTransition(
          duration: Duration(seconds: 1),
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
