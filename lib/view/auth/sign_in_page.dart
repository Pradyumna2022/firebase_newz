import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newsapp/view/widgets/toast_message.dart';

import '../const/const.dart';
import '../home_page.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28.0),
                    child: Text("Welcome to News App",style: TextStyle(
                      fontSize: 25,fontWeight: FontWeight.bold,color: backgroundColor
                    ),),
                  ),
                  // email field
                  TextFormField(
                    controller: emailController,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Email Must';
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Email',
                        focusedBorder: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                        focusedErrorBorder: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: passwordController,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Password Must';
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Password',
                        focusedBorder: OutlineInputBorder(),
                        focusedErrorBorder: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder()
                    ),
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
                      Text('Already have an account'),
                      SizedBox(width: 5,),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                          },
                          child: Text("Login",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
