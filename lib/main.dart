import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scannermodelclass/provider/api_changenotifier.dart';
import 'package:scannermodelclass/screens/login_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider<ScanNotifier>(create: (context) => ScanNotifier(),)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
