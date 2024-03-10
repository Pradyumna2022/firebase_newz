import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newsapp/view/auth/sign_in_page.dart';
import 'package:newsapp/view/home_page.dart';
import 'package:newsapp/view/widgets/toast_message.dart';
import 'package:video_player/video_player.dart';

import '../const/const.dart';
import '../widgets/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  VideoPlayerController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.asset('lib/assets/images/login.mp4')
      ..initialize().then((_) {
        controller!.play();
        controller!.setLooping(true);
        setState(() {});
      });



  }
  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            alignment: Alignment.center,
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
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42.0),
                  child: Column(
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70),
                      ),
                      // email field
                      MyTextField(
                        controller:emailController, validationText: 'Email Must', hintText: 'Email',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextField(
                        controller:passwordController, validationText: 'Password Must', hintText: 'Password',

                      ),

                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final box = GetStorage();

                              print("Good Job Login in !");
                              _auth
                                  .signInWithEmailAndPassword(
                                      email: emailController.text.toString(),
                                      password: passwordController.text.toString())
                                  .then((value) {
                                Utils().toastMessage(value.user!.email.toString() +
                                    '  Congratulation');
                                box.write('emailKey', value.user!.email.toString());
                                Timer.periodic(Duration(seconds: 3), (timer) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                      (route) => false);
                                });
                              }).onError((error, stackTrace) {
                                Utils().toastMessage(error.toString());
                              });
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: buttonTextColor),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: backgroundColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Don\'t have an account',
                            style: TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                              onTap: () {
                                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignInPage()), (route) => false);
                              },
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
