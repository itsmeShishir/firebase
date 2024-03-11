import 'dart:async'; 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop/screen/Dashboard/dashboard.dart';
import 'package:shop/screen/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key); 

  static const String route = "/";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    final user = auth.currentUser;
    if(user!= null){
      Timer(const Duration(seconds:3 ), ()=> Navigator.pushNamed(context, "/dash"));
    }else{
      Timer(const Duration(seconds:3 ), ()=> Navigator.pushNamed(context, "/login"));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://images.unsplash.com/photo-1599305445671-ac291c95aaa9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bG9nb3xlbnwwfHwwfHx8MA%3D%3D",
              width: 50,
              height: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text.rich(
              TextSpan(
                text: "Hello",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                children: [
                  TextSpan(
                    text: "Shop",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CircularProgressIndicator(
              color: Color.fromARGB(255, 255, 17, 0),
            ),
          ],
        ),
      ),
    );
  }
}
