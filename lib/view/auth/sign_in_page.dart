import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newsapp/view/widgets/toast_message.dart';
import 'package:video_player/video_player.dart';

import '../const/const.dart';
import '../home_page.dart';
import '../widgets/my_text_field.dart';
import 'login_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children:[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: <Color>[
                  Color(0xff1f005c),
                  Color(0xff5b0060),
                  Color(0xff870160),
                  Color(0xffac255e),
                  Color(0xffca485c),
                  Color(0xffe16b5c),
                  Color(0xfff39060),
                  Color(0xffffb56b),
                ],
                tileMode: TileMode.mirror,
              ),
            ),
          ),
          Form(
          key: _formKey,
          child: SingleChildScrollView(
            child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28.0),
                    child: Text("Welcome to News App",style: TextStyle(
                        fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white
                    ),),
                  ),
                  // email field
                  MyTextField(
                    controller:emailController, validationText: 'Email Must', hintText: 'Email',
                  ),
                  SizedBox(height: 10,),
                  MyTextField(
                    controller:passwordController, validationText: 'Password Must', hintText: 'Password',
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 60,width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      if(_formKey.currentState!.validate()){
                        print("Good Job Sign in !");
                        final box = GetStorage();
                        _auth.createUserWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.text.toString())
                            .then((value){
                          Utils().toastMessage(value.user!.email.toString() + '  Congratulation');
                          box.write('emailKey', emailController.text.toString());
                          print(box.read('emailKey' + "This SI KEY O 777777777777777777"));
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                          Timer.periodic(Duration(seconds: 3), (timer) {
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
                          });
                          print(value.user!.email.toString());


                        }).onError((error, stackTrace) {
                          Utils().toastMessage(error.toString());
                        });
                      }
                    }, child: Text("Sign in",style: TextStyle(
                        color: buttonTextColor
                    ),),style: ElevatedButton.styleFrom(backgroundColor: backgroundColor,shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Already have an account',style: TextStyle(color: Colors.white54,fontWeight: FontWeight.bold,fontSize: 15)),
                      SizedBox(width: 5,),
                      GestureDetector(
                          onTap: (){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
                          },
                          child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]
      ),
    );
  }
}
