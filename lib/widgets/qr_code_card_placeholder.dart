import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodePlaceholder extends StatelessWidget {
  final Barcode? result;
  const QRCodePlaceholder({
    Key? key,
    this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          elevation: 1.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                      // color: generateMaterialColor(Palette.primary)[300],
                      // border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(80))),
                  width: 80,
                  height: 80,
                  child: const Image(
                    image: AssetImage(
                      "assets/icon.png",
                    ),
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     "${AppStrings["AppName"]}",
              //     style: const TextStyle(
              //       // color: Colors.white,
              //       fontSize: 24,
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Premium ESOwP limited'.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: (result != null)
                    ? Text('   Data: ${result!.code}')
                    : const Text(
                        'Scan a code',
                        style: TextStyle(fontSize: 16),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       OutlineButtonWidget(
              //         onPressed: () {},
              //         label: "Github",
              //         icon: FontAwesomeIcons.github,
              //         url: AppStrings['github_link'],
              //         snackBarErrMsg: "Error!",
              //         snackBarErrorIcon: Icons.error_outline_rounded,
              //       ),
              //       OutlineButtonWidget(
              //         onPressed: () {},
              //         label: "Review",
              //         icon: Icons.rate_review,
              //         url: AppStrings['review'],
              //         snackBarErrMsg: "Error!",
              //         snackBarErrorIcon: Icons.error_outline_rounded,
              //       ),
              //       OutlineButtonWidget(
              //         onPressed: () {},
              //         label: "Support",
              //         icon: Icons.support_rounded,
              //         url: AppStrings['support'],
              //         snackBarErrMsg: "Error!",
              //         snackBarErrorIcon: Icons.error_outline_rounded,
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    ));
  }
}
