import 'package:flutter/material.dart';

class SingleScreen extends StatefulWidget {
  const SingleScreen({super.key});

  @override
  State<SingleScreen> createState() => _SingleScreenState();
}

class _SingleScreenState extends State<SingleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single Blog"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image.network(
                "https://images.unsplash.com/photo-1708649290066-5f617003b93f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8"),
            const Text(
              "THis is A Title Of the Blog",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
