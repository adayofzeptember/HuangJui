import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huangjui/login.dart';

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
        primarySwatch: Colors.red,
        appBarTheme: AppBarTheme(color: Colors.red),
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
    _Load_AndGo();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    super.initState();
  }

  Future _Load_AndGo() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login_Page(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/start.svg',
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * 1,
            )
          ],
        ),
      ),
    );
  }
}

