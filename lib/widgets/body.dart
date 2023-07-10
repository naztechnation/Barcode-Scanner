import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pesowp_scan/utils/utils.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

import 'qr_code_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with WidgetsBindingObserver {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController _controller;

  Barcode? result;

  bool _flashOn = false;
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller.stopCamera();
      _controller.flipCamera();
      _controller.stopCamera();
      _controller.flipCamera();
      _controller.resumeCamera();
    } else if (Platform.isIOS) {
      // controller.pauseCamera();
      _controller.resumeCamera();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.stopCamera();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            qRCamW(),
            QRCodeCard(
              result: result,
            ),
          ],
        ),
      ),
    );
  }

  Widget qRCamW() {
    return Center(
      child: SizedBox(
          width: double.infinity,
          height: (MediaQuery.of(context).size.height * 0.50).roundToDouble(),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: QRView(
                    cameraFacing: CameraFacing.back,
                    key: qrKey,
                    onQRViewCreated: (p0) {
                      _controller = p0;
                      _controller.scannedDataStream.listen((event) {
                        debugPrint(event.code);
                        // Fluttertoast.showToast(
                        //     msg: "${event.code}",
                        //     toastLength: Toast.LENGTH_SHORT,
                        //     gravity: ToastGravity.CENTER,
                        //     timeInSecForIosWeb: 1,
                        //     backgroundColor: Colors.red,
                        //     textColor: Colors.white,
                        //     fontSize: 16.0);

                        _launchUrl(Uri.parse(event.code.toString()));
                        //  Utils.lauchURl(event.code.toString());

                        if (event.code != null) {}
                        setState(() {
                          result = event;
                        });
                        //  BlocProvider.of<QRBloc>(context).add(QRLoad(QRCode(
                        //   Random.secure().nextInt(100),
                        //  event.code!,
                        // event.format.formatName,
                        // )));
                      });
                    },
                    overlay: QrScannerOverlayShape(
                      borderColor: Theme.of(context).primaryColor,
                      borderRadius: 8,
                      borderLength: 36,
                      cutOutSize: 256,
                      cutOutBottomOffset: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: IconButton(
                    onPressed: () {
                      _controller.toggleFlash();
                      setState(() {
                        _flashOn = !_flashOn;
                      });
                    },
                    color: Colors.white,
                    iconSize: 36,
                    icon: Icon(_flashOn ? Icons.flash_off : Icons.flash_on),
                    alignment: Alignment.center,
                  ),
                ),
              )
            ],
          )),
    );
  }

  //final Uri _url = Uri.parse('https://flutter.dev');

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
