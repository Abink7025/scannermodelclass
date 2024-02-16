
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scannermodelclass/screens/detail_screen.dart';
import 'package:scannermodelclass/utils/colors.dart';

class CamaraScreen extends StatefulWidget {
  const CamaraScreen({super.key});

  @override
  State<CamaraScreen> createState() => _CamaraScreenState();
}

class _CamaraScreenState extends State<CamaraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 300,
              height: 300,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  border: Border.all(color: kColorwhite),
                  borderRadius: BorderRadius.circular(20)),
              child: MobileScanner(
                  fit: BoxFit.cover,
                  allowDuplicates: false,
                  onDetect: (barcode, args) {
                    if (barcode.rawValue == null) {
                      print('Failed to scan Barcode');
                    } else {
                      final String code = barcode.rawValue!;
                      print('hjfahvfhavsfhahgvf');
                      print(code);

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailScreen(rollno: code),
                      ));
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
