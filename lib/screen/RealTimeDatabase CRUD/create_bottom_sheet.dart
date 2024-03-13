import 'package:flutter/material.dart';
import 'package:shop/screen/RealTimeDatabase%20CRUD/real_tim_crud.dart';

final TextEditingController titleController = TextEditingController();
final TextEditingController descriptionController = TextEditingController();

void createBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.blue[100],
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text(
                  "Create your items",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "title",
                  hintText: "eg.Elon",
                ),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: "description",
                  hintText: "eg.Description",
                ),
              ),
              const SizedBox(
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
                    // For clear the controller
                    titleController.clear();
                    descriptionController.clear();
                    //For Dismiss the keyboard afte adding items
                    Navigator.pop(context);
                  },
                  child: const Text("add"))
            ],
          ),
        );
      });
}
