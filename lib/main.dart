import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:huangjui/Etc/color_for_app.dart';
import 'package:huangjui/Login%20&%20Register/register_1_page.dart';
import 'package:huangjui/Login%20&%20Register/register_3_from.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const Start_Page_HuangJui()));
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
        Locale('th', 'TH'), // Thai
      ],
      theme: ThemeData(
        fontFamily: 'Kanit',
        primarySwatch: theRed,
      ),
      home: const AppBackground(),
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

    systemOverlayStyle:
    SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        statusBarColor: theRed);
    super.initState();
  }

  Route route_animated(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Future<void> _Load_And_Go() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        PageTransition(
          duration: Duration(seconds: 1),
          type: PageTransitionType.rightToLeft,
          child: Register_Page(),
        ),
      );
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) =>  Register_Page(),
      //   ),
      // );
    });
  }

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
              child: Image.asset(
                'assets/images/loading.jpg',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
