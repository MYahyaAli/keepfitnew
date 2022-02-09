import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:keepfit/screens/login_screen.dart';
import 'package:keepfit/screens/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keep-Fit',
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      //theme: ThemeData(
      //  primarySwatch: Colors.red,
      //),
      home: const LoginScreen(),
    );
  }
}
