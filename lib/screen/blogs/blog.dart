import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final databaseReference = FirebaseDatabase.instance.ref("StoreData");

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Add new Blog Title And Description",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: "title",
                      hintText: "eg.Elon",
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: "description",
                      hintText: "eg.Description",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final id = DateTime.now().microsecond.toString();
                      databaseReference.child(id).set({
                        'title': titleController.text.toString(),
                        'description': descriptionController.text.toString(),
                        'id': id //It's give the unique id every time.
                      });
                      titleController.clear();
                      descriptionController.clear();
                      Navigator.pushNamed(context, "/dash");
                    },
                    child: Text("Upload"),
                  ),
                ],
              ),
            ],
          ),
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
