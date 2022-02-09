import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:keepfit/model/weight_model.dart';
import 'package:keepfit/screens/home_screen.dart';
import 'package:keepfit/screens/login_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  SettingScreenState createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  final _auth = FirebaseAuth.instance;

  //formkey
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        Container(
          color: Colors.redAccent,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.home,
                size: 50,
                color: Colors.white,
              ),
              Text(
                "Home",
                style: TextStyle(color: Colors.white, fontSize: 30),
              )
            ],
          ),
        ),
        InkWell(
          child: Container(
            color: Colors.redAccent.shade50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "Dark/Light Theme",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: Container(
            color: Colors.redAccent.shade100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "Back",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            logout(context);
          },
          child: Container(
            color: Colors.redAccent.shade200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )
              ],
            ),
          ),
        ),
      ],
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
    ));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
