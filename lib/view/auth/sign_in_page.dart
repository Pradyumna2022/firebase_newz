import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../const/const.dart';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      print("Good JOb !");
                      _auth.createUserWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.text.toString());
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
    );
  }
}
