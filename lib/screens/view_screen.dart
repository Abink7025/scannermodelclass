
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scannermodelclass/screens/camara_screen.dart';
import 'package:scannermodelclass/utils/colors.dart';

class ViewScreen extends StatefulWidget {
  ViewScreen({
    super.key,
    required this.text,
  });
  final String text;

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200), color: kColorwhite),
              child: Icon(
                Icons.person,
                size: 75,
                color: Colors.green,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(widget.text),
          ),
          SizedBox(
            height: 20,
          ),
          QrImageView(
            data: widget.text,
            version: QrVersions.auto,
            size: 200.0,
            backgroundColor: kColorwhite,
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CamaraScreen(),
                ),
              );
            },
            child: Text(
              'Scan',
              style: TextStyle(color: kColorwhite),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              side: BorderSide(color: kColorwhite),
            ),
          )
        ],
      ),
    );
  }
}
