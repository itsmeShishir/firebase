import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:shop/screen/RealTimeDatabase%20CRUD/create_bottom_sheet.dart';
import 'package:shop/screen/RealTimeDatabase%20CRUD/update_bottom_sheet.dart';

class RealTimeCRUDEdatabase extends StatefulWidget {
  const RealTimeCRUDEdatabase({super.key});

  @override
  State<RealTimeCRUDEdatabase> createState() => _RealTimeDatabaseState();
}

final databaseReference = FirebaseDatabase.instance.ref("StoreData");

class _RealTimeDatabaseState extends State<RealTimeCRUDEdatabase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blue[100],
      body: Column(
        children: [
          Expanded(
              child: FirebaseAnimatedList(
                  query: databaseReference,
                  itemBuilder: (context, snapshot, index, animation) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(
                          snapshot.child("title").value.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle:
                            Text(snapshot.child("description").value.toString()),
                        trailing: PopupMenuButton(
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            // For Update Operation
                            PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  updateBottomSheet(
                                    context,
                                    snapshot.child("name").value.toString(),
                                    snapshot.child("id").value.toString(),
                                    snapshot.child("address").value.toString(),
                                  );
                                },
                                leading: const Icon(Icons.edit),
                                title: const Text("Edit"),
                              ),
                            ),
                            // For Delete Operation
                            PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  databaseReference
                                      .child(
                                          snapshot.child('id').value.toString())
                                      .remove();
                                },
                                leading: const Icon(Icons.delete),
                                title: const Text("Delete"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
      // For Create Operation
      floatingActionButton: FloatingActionButton(
        onPressed: () => createBottomSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
