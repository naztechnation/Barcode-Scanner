import 'package:flutter/material.dart';

import 'body.dart';

class QRHome extends StatefulWidget {
  QRHome({Key? key, this.title = ''}) : super(key: key);
  final String title;
  @override
  _QRHomeState createState() => _QRHomeState();
}

class _QRHomeState extends State<QRHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      // bottomNavigationBar: ClipRRect(
      //   borderRadius: const BorderRadius.vertical(
      //     top: Radius.circular(12.0),
      //   ),
      //   child: BottomAppBar(
      //     shape: const CircularNotchedRectangle(),
      //     color: Theme.of(context).primaryColor,
      //     child: Row(
      //       mainAxisSize: MainAxisSize.max,
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         Builder(
      //           builder: (context) => IconButton(
      //             tooltip: 'Open navigation menu',
      //             icon: Icon(
      //               Icons.info,
      //               color: Theme.of(context).cardColor,
      //             ),
      //             onPressed: () {
      //               showAboutDialog(
      //                 context: context,
      //                 applicationIcon: const Image(
      //                   image: AssetImage('assets/icon.png'),
      //                   fit: BoxFit.scaleDown,
      //                   height: 64,
      //                   width: 64,
      //                 ),
      //                 applicationName: AppStrings["AppName"],
      //                 applicationVersion: AppStrings["EDITION"],
      //                 applicationLegalese: 'Omer Asif',
      //               );
      //             },
      //           ),
      //         ),
      //       ],
      //     ),
      //  ),
      // ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
