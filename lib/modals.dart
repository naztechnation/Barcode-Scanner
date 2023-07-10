import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../enum.dart';

class Modals {
 

  static void showToast(String message, {MessageType? messageType, Toast toastType = Toast.LENGTH_SHORT}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: toastType,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: messageType == MessageType.success
            ? Colors.green
            : messageType == MessageType.error
            ? Colors.red
            : null,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Future<bool?> showAlertOptionDialog(context,
      {required String title,
        required String message,
         String? message2 = '',
         String? message3 = '',
         bool showNoBtn = true,
  final VoidCallback? onPressed,
  final Color? txtColor1 = Colors.red,
  final Color? txtColor2 = Colors.red,

        String buttonYesText = 'Yes',
        String buttonNoText = 'No'}) async {
    final data = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: RichText(
  text: TextSpan(
    style: const TextStyle(color: Colors.black),
    children: [
      TextSpan(
        text: message,
        style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      TextSpan(
        text: message2,
        style: const TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),
      ),
      TextSpan(
        text: message3,
        style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ],
  ),
),
            actions: [
              TextButton(
                child: Text(buttonNoText, style: TextStyle(color: txtColor1),),
                onPressed: () => Navigator.pop(context, false),
              ) ,
            showNoBtn ?  ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: txtColor1),
                child: Text(buttonYesText, style: TextStyle(color: txtColor2),),
                
                onPressed:  onPressed,
              ) : Container()
            ],
          );
        });
    return data;
  }

  static Future<dynamic> showBottomSheetModal(BuildContext context,
      {required Widget page,
        double? heightFactor = 0.5,
        bool isScrollControlled = false,
        bool isDissmissible = false,
        double borderRadius = 20.0}) async {
    final data = await showModalBottomSheet<dynamic>(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.vertical(top: Radius.circular(borderRadius))),
        backgroundColor: Theme.of(context).backgroundColor,
        isScrollControlled: isScrollControlled,
        isDismissible: isDissmissible,
        useSafeArea: true,
        builder: (BuildContext bc) {
          return FractionallySizedBox(heightFactor: heightFactor, child: page);
        });
    return data;
  }

  static Future<dynamic> showDialogModal(BuildContext context,
      {required Widget page, double borderRadius = 20.0}) async {
    final data = await showDialog<dynamic>(
        context: context,
        useSafeArea: false,
        builder: (BuildContext context) {
          return ConstrainedBox(
  constraints: const BoxConstraints(maxHeight: 100.0),
            child: Dialog(
              insetPadding: const EdgeInsets.symmetric(
              horizontal: 0.0,
              vertical: 0.0,
            ),
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(borderRadius)), //this right here
                child: page),
          );
        });
    return data;
  }
}