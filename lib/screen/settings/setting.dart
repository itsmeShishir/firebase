import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingScren extends StatefulWidget {
  const SettingScren({super.key});

  @override
  State<SettingScren> createState() => _SettingScrenState();
}

class _SettingScrenState extends State<SettingScren> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                auth.signOut().then(
                      (value) => Navigator.pushNamed(context, "/login"),
                    );
                toastMessage("Successfully logout");
              },
              child: const Text("Sign Out"),
            ),
            TextButton(onPressed: (){
              Navigator.pushNamed(context, "/map");
            }, child: const Text("Map"))
          ],
        ),
      ),
    );
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
  }
}
