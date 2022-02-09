import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:keepfit/model/weight_model.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({Key? key}) : super(key: key);

  @override
  WeightScreenState createState() => WeightScreenState();
}

class WeightScreenState extends State<WeightScreen> {
  final _auth = FirebaseAuth.instance;

  //formkey
  final formKey = GlobalKey<FormState>();

  //text editing controller
  final weightController = new TextEditingController();
  final heightController = new TextEditingController();
  final cupOfWater = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //weight
    final weightField = TextFormField(
      autofocus: true,
      controller: weightController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Enter Weight");
        }
        return null;
      },
      onSaved: (value) {
        weightController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Weight (Kg)",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //height
    final heightField = TextFormField(
      autofocus: false,
      controller: heightController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Enter Height");
        }
        return null;
      },
      onSaved: (value) {
        heightController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Height (ft)",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //no of cups
    final cupOfwaterField = TextFormField(
      autofocus: false,
      controller: cupOfWater,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Enter Height");
        }
        return null;
      },
      onSaved: (value) {
        cupOfWater.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Height (ft)",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //button
    final continueButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {},
        child: const Text(
          "Continue",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            //passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 180,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),
                    weightField,
                    SizedBox(height: 20),
                    heightField,
                    SizedBox(height: 20),
                    cupOfwaterField,
                    SizedBox(height: 20),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*void nextBtn(String weight, String height, String cupOfWater) async {
    //code to save weight data in the database
  }

  postDetailsToFirebase() async {
    //call firestore
    //call usermodel
    //send the values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    WeightModel weightModel = WeightModel();

    //write the values
    weightModel.weight = weightController.text;
    weightModel.height = heightController.text;
    weightModel.noOfCups = cupOfWater.text;

    await firebaseFirestore
        .collection("users")
        .doc(_auth.currentUser?.uid)
        .set(weightModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfully");

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const WeightScreen()),
        (route) => false);
  }*/
}
