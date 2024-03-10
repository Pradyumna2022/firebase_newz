import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newsapp/view/auth/login_page.dart';
import 'package:newsapp/view/auth/sign_in_page.dart';
import 'package:newsapp/view/home_page.dart';
import 'package:video_player/video_player.dart';
// bool showSplash = true;
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  VideoPlayerController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();



      controller = VideoPlayerController.asset('lib/assets/images/v.mp4')
        ..initialize().then((_) {
          controller!.play();
          controller!.setLooping(true);
          setState(() {});
        });

    final box = GetStorage();
    Timer.periodic(Duration(seconds: 5), (timer) {
      if(box.read('emailKey')!=null){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
      }else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: controller!.value.size.width ?? 0,
                height: controller!.value.size.height ?? 0,
                child: VideoPlayer(controller!),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
