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
          const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
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
