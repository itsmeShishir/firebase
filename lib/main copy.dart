// import 'package:flutter/material.dart';
// import 'package:shop/screen/Dashboard/dashboard.dart';
// import 'package:shop/screen/homeScreen/homeScree.dart';
// import 'package:shop/screen/login/login.dart';
// import 'package:shop/screen/register/register.dart';
// import 'package:shop/screen/splashScreen/splashScreen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Theme Example',
//       theme: lightTheme,
//       darkTheme: darkTheme,
//       debugShowCheckedModeBanner: false,
//       initialRoute: "/",
//       routes: {
//         "/": (context) => SplashScreen(),
//         "/login": (context) => LoginScreen(),
//         "/register": (context) => RegisterScreen(),
//         "/home": (context) => HomeScreen(),
//         "/dash": (context) => Dashboard(),
//       },
//     );
//   }
// }

// final ThemeData lightTheme = ThemeData(
//   primarySwatch: Colors.blue,
//   textTheme: TextTheme(
//     headline1: TextStyle(
//         fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
//     headline2: TextStyle(
//         fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
//     headline3: TextStyle(
//         fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
//     bodyText1: TextStyle(fontSize: 16, color: Colors.black),
//     bodyText2: TextStyle(fontSize: 16, color: Colors.black),
//   ),
//   iconTheme: IconThemeData(color: Colors.blue),
// );

// final ThemeData darkTheme = ThemeData.dark().copyWith(
//   iconTheme: IconThemeData(color: Colors.orange),
// );
