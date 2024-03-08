

import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsapp/view/const/const.dart';

class Utils{

  void toastMessage(String message){
    Fluttertoast.showToast(msg: message,
    backgroundColor: backgroundColor,textColor: buttonTextColor,);
  }
}