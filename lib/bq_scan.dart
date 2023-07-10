import 'dart:io';

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pesowp_scan/modals.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RegExp regex = RegExp(r'http(s)?:\/\/[^\s]*');
  String barcode = 'Tap  to scan';

  bool isWebOpen = false;
                bool _isDialogOpen = false;


  _onWillPop() async {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MyHomePage()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' PESOWP'),
        backgroundColor: const Color(0xFFf45c2c),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (isWebOpen) {
            setState(() {
              isWebOpen = false;
            });
            return _onWillPop();
          } else {
            return exit(0);
          }
        },
        child: AiBarcodeScanner(
          canPop: false,
          onScan: (String value) {

            if (_isDialogOpen) {
      Navigator.of(context).pop();
      setState(() {
        _isDialogOpen = false;
      });
    }
            setState(() {
              barcode = value;
 bool containsLink =false;
             setState(() {
              containsLink  = regex.hasMatch(value);
             });

              if (containsLink) {
                Iterable<Match> matches = regex.allMatches(value);

                List<String?> links =
                    matches.map((match) => match.group(0)).toList();
                // Modals.showToast(links[0].toString());

                _launchUrl(Uri.parse(links[0].toString()));
                setState(() {
                  isWebOpen = true;
                });
              } else {
                 setState(() {
      _isDialogOpen = true;
    });
                
                Modals.showAlertOptionDialog(context, title: 'Text', message: value, showNoBtn: false, buttonNoText: 'Close').then((_) {
      setState(() {
        _isDialogOpen = false;
      });
    });;
                
               // Fluttertoast.showToast(msg: value);
              }
            });
          },
          onDetect: (p0) {},
          onDispose: () {
            debugPrint("Barcode scanner disposed!");
          },
          controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.normal, detectionTimeoutMs: 250),
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      // await launchUrl(url, );
    }
  }
}
