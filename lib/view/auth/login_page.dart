import 'package:flutter/material.dart';
import 'package:newsapp/view/auth/sign_in_page.dart';

import '../const/const.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                    }
                  }, child: Text("Login",style: TextStyle(
                    color: buttonTextColor
                  ),),style: ElevatedButton.styleFrom(backgroundColor: backgroundColor,shape: 
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Don\'t have an account'),
                    SizedBox(width: 5,),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                        },
                        child: Text("Sign in",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15),))
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
