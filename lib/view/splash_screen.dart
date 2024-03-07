import 'dart:async';

import 'package:flutter/material.dart';
bool showSplash = true;
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        showSplash = false;
        print('one time');
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('lib/assets/images/new3.jpg'),
    );
  }
}
