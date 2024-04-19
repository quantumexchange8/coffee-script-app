import 'package:flutter/material.dart';

Future pushReplacement(BuildContext context,
    {required Widget nextPage, Offset? begin}) async {
  return await Navigator.pushReplacement(context, PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return SlideTransition(
          position: animation.drive(
              Tween(begin: begin ?? const Offset(1.0, 0), end: Offset.zero)
                  .chain(
            CurveTween(curve: Curves.linear),
          )),
          child: nextPage);
    },
  ));
}

bool changeBoolString(String boolString) {
  return boolString == 'true' ? true : false;
}
