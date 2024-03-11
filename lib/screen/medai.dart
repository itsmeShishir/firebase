import 'package:flutter/material.dart';

class MyMedia extends StatefulWidget {
  const MyMedia({super.key});

  @override
  State<MyMedia> createState() => _MyMediaState();
}

class _MyMediaState extends State<MyMedia> {
  
  @override
  Widget build(BuildContext context) {
    double sizewidth = MediaQuery.of(context).size.width;
    double sizeheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Width : $sizewidth"),
            Text("Heigth; $sizeheight"),
          ],
        ),
      ),
    );
  }
}