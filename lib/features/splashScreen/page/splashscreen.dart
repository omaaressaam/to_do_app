import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:to_do_app/features/borad_screen/page/boardScreen.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BoardScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.green,
        child: Center(
            child: Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  'assets/images/to-do-list.png',
                  fit: BoxFit.cover,
                ))));
  }
}
