import 'package:flutter/material.dart';

import '../const/const.dart';

class NewTileWidget extends StatelessWidget {
  final String imagePath;
  final String newsTitle;
  final String newsDescription;
  final void Function() onPressed;
  const NewTileWidget({super.key, required this.imagePath, required this.newsTitle, required this.newsDescription, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final  height = MediaQuery.of(context).size.height;
    final  width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: height*0.35,
              width: width,
              child: Image.network(imagePath,fit: BoxFit.contain,)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
            child: Text(newsTitle,style: const TextStyle(
                fontSize: newTitleFontSize,fontWeight: FontWeight.bold
            ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(newsDescription),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10.0,bottom: 10),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(onPressed: onPressed, child: const Text("Read More",style: TextStyle(
                  color: buttonTextColor
              ),),style: ElevatedButton.styleFrom(backgroundColor: buttonColor,
              ),),
            ),
          )
        ],
      ),
    );
  }
}