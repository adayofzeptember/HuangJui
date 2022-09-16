import 'package:flutter/material.dart';
import 'package:huangjui/Etc/color_for_app.dart';

class ProgressHUD extends StatelessWidget {
  final Widget child;
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  const ProgressHUD({
    key,
    required this.child,
    required this.inAsyncCall,
    this.opacity = 1,
    this.color = Palette.thisRed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = <Widget>[];
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              DefaultTextStyle(
                style: TextStyle(
                  fontFamily: 'Kanit',
                  color: Colors.white,
                ),
                child: Text(
                  'โปรดรอสักครู่..',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          )),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
