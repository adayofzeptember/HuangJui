import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:huangjui/Etc/color_for_app.dart';
import 'package:huangjui/main_Calendar.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _hasPermissions = false;
  CompassEvent? _lastRead;
  DateTime? _lastReadAt;

  @override
  void initState() {
    super.initState();

    _fetchPermissionStatus();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
              statusBarColor: theRed),
          backgroundColor: Palette.thisRed,
          title: const Text('Compass 555'),
        ),
        body: Builder(builder: (context) {
          return Column(
            children: <Widget>[
              //_buildManualReader(),
              Expanded(child: _buildCompass()),
              SmoothCompass(
                rotationSpeed: 500,
                height: 300,
                width: 300,
                compassBuilder: (context,
                    AsyncSnapshot<CompassModel>? compassData,
                    Widget compassAsset) {
                  return compassAsset;
                },
              ),
              SmoothCompass(
                rotationSpeed: 200,
                height: 250,
                width: 250,
                compassAsset: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/needles.png'),
                          fit: BoxFit.cover)),
                ),
                compassBuilder: (context,
                    AsyncSnapshot<CompassModel>? compassData,
                    Widget compassAsset) {
                  return compassAsset;
                },
              )
            ],
          );
        }),
      ),
    );
  }

  Widget _buildManualReader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          ElevatedButton(
            child: Text('กด'),
            onPressed: () async {
              final CompassEvent tmp = await FlutterCompass.events!.first;
              setState(() {
                _lastRead = tmp;
                _lastReadAt = DateTime.now();
              });
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$_lastRead',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    '$_lastReadAt',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompass() {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        double? direction = snapshot.data!.heading;

        if (direction == null)
          return Center(
            child: Text("Device does not have sensors !"),
          );

        return Material(
          shape: CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 0.0,
          child: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 96, 214, 145),
              // image: DecorationImage(
              //     image: AssetImage("assets/images/loading.jpg"),
              //     fit: BoxFit.cover)
            ),
            child: Transform.rotate(
                angle: (direction * (math.pi / 180) * -1),
                child: Stack(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Main_Calendar(),
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/images/needles.png",
                          height: 550,
                        )
                        // Text(
                        //   '>',
                        //   style: TextStyle(
                        //       color: Colors.black,
                        //       fontFamily: 'Kanit',
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 50),
                        // ),
                        ),
                  ],
                )),
          ),
        );
      },
    );
  }

  Widget _buildPermissionSheet() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Location Permission Required'),
          ElevatedButton(
            child: Text('Request Permissions'),
            onPressed: () {},
          ),
          SizedBox(height: 16),
          ElevatedButton(
            child: Text('Open App Settings'),
            onPressed: () {
              //
              ;
            },
          )
        ],
      ),
    );
  }

  void _fetchPermissionStatus() {}
}
