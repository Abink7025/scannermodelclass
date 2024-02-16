import 'package:flutter/material.dart';
import 'package:scannermodelclass/utils/colors.dart';



class TextfieldWiget extends StatefulWidget {
  TextfieldWiget(
      {super.key, required this.hittext, required this.textcontroller});
  final String hittext;
  final TextEditingController textcontroller;

  @override
  State<TextfieldWiget> createState() => _TextfieldWigetState();
}

class _TextfieldWigetState extends State<TextfieldWiget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Container(
          height: 79,
          child: TextField(
            controller: widget.textcontroller,
            decoration: InputDecoration(
                hintText: widget.hittext,
                hintStyle: TextStyle(color: kColorwhite),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kColorwhite),
                    borderRadius: BorderRadius.circular(10)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: kColorwhite, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kColorwhite))),
          ),
        ));
  }
}
