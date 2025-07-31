import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ToastUtils {
 static  Future<bool?> toastMsg({ required String msg, required Color backgroundColor, required Color textColor }){
   return  Fluttertoast.showToast(
          msg: msg,
           toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.BOTTOM,
               backgroundColor: backgroundColor,
               textColor: textColor,
             fontSize: 16.0,
);
            // Navigator.pop(context);
        }
 }


