import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newsapp/view/auth/sign_in_page.dart';
import 'package:newsapp/view/home_page.dart';
// bool showSplash = true;
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
    final box = GetStorage();
    Timer.periodic(Duration(seconds: 5), (timer) {
      if(box.read('emailKey')!=null){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
      }else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignInPage()), (route) => false);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Image.asset('lib/assets/images/splashnewz.jpg',fit: BoxFit.contain,)),
      ),
    );
  }
}
