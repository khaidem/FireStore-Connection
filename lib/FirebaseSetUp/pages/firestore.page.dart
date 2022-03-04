import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStorePage extends StatefulWidget {
  const FireStorePage({Key? key}) : super(key: key);

  @override
  State<FireStorePage> createState() => _FireStorePageState();
}
// final firestoreInstance = FirebaseFirestore.instance;

class _FireStorePageState extends State<FireStorePage> {
  var name = '';
  var age = '';
  final _formKey = GlobalKey<FormState>();
  Map? data;
  addData() {
    Map<String, dynamic> demoData = {
      "Name": "Finish",
      "demo": "jalo",
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('data');
    collectionReference.add(demoData);
  }

  // fetechData() {
  //   CollectionReference collectionReference =
  //       FirebaseFirestore.instance.collection('data');
  //   collectionReference.snapshots().listen((snapShot) {
  //     setState(() {
  //       // data = snapShot.docs[0].data;
  //     });
  //   });
  // }

  deleteData() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('data');
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs[0].reference..delete();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('data');
    return Scaffold(
      appBar: AppBar(
        title: const Text('FireStore Connection'),
      ),
      body: Form(
        child: Column(
          key: _formKey,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Name',
                labelText: 'Name',
              ),
              onChanged: (value) {
                name:
                value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter name';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.date_range),
                hintText: 'Age',
                labelText: 'Age',
              ),
              onChanged: (value) {
                age:
                int.parse(value);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter age';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Your are successfully'),
                      ),
                    );
                    // data.addAll({'name' : name, 'age': age}).
                  }
                },
                child: const Text('Submit')),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: deleteData,
              child: const Text('Delete'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: addData,
              child: Text('Add Data'),
            ),
            const SizedBox(height: 10),
            Text(
              data.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
