

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scannermodelclass/provider/api_changenotifier.dart';
import 'package:scannermodelclass/utils/colors.dart';
import 'package:scannermodelclass/widgets/textfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();

  final rollnoController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data = context.watch<ScanNotifier>();
    return Scaffold(
      backgroundColor: Colors.green,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            'Registration',
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 24, color: kColorwhite),
          ),
          TextfieldWiget(
              hittext: 'Enter your name', textcontroller: nameController),
          TextfieldWiget(
              hittext: 'Enter your rollno', textcontroller: rollnoController),
          TextfieldWiget(
              hittext: 'Enter your email', textcontroller: emailController),
          TextfieldWiget(
              hittext: 'Enter your password',
              textcontroller: passwordController),
          SizedBox(
            height: 30,
          ),
          data.loading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : ElevatedButton(
                  onPressed: () {
                    context.read<ScanNotifier>().registerNotifier(
                        name: nameController.text,
                        rollno: rollnoController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        context: context);
                  },
                  child: const Text('Rigister'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      side: const BorderSide(color: kColorwhite)),
                )
        ],
      ),
    );
  }
}
