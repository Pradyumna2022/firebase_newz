import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String validationText;
  final String hintText;
  const MyTextField({super.key, required this.controller, required this.validationText,  required this.hintText});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: Colors.white70,width: 1
          )
      ),
      child: TextFormField(
        cursorColor: Colors.white60,
        style: TextStyle(color: Colors.white,),
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return validationText;
          }
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.white70
            ),
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none),
      ),
    );
  }
}
