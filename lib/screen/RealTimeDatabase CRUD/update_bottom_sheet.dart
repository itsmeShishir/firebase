import 'package:flutter/material.dart';
import 'package:shop/screen/RealTimeDatabase%20CRUD/real_tim_crud.dart';

final TextEditingController titleController = TextEditingController();
final TextEditingController descriptionController = TextEditingController();

void updateBottomSheet(BuildContext context, title, id,  description) {
  titleController.text = title;
  descriptionController.text = description;
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
                  hintText: "eg.UK",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    databaseReference.child(id).update({
                      'title': titleController.text.toString(),
                      'description': descriptionController.text.toString(),
                    });

                    //For Dismiss the keyboard afte adding items
                    Navigator.pop(context);
                  },
                  child: const Text("Update"))
            ],
          ),
        );
      });
}
