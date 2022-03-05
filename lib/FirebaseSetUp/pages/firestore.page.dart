import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class FireStorePage extends StatefulWidget {
  const FireStorePage({Key? key}) : super(key: key);

  @override
  State<FireStorePage> createState() => _FireStorePageState();
}

class _FireStorePageState extends State<FireStorePage> {
  var name = '';
  var age = '';
  final _formKey = GlobalKey<FormState>();
  // Map? data;
  addData() {
    Map<String, dynamic> demoData = {
      "Name": "Another",
      "age": "25",
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('data');
    collectionReference.add(demoData);
  }

  fetechData() async {
    DocumentSnapshot varaible = await FirebaseFirestore.instance
        .collection('data')
        .doc('q1cBQnCbcajVN9h15zzq')
        .get();
    print(varaible['Name']);
  }

  deleteData() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('data');
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs[0].reference.delete();
  }

  final Stream<QuerySnapshot> user =
      FirebaseFirestore.instance.collection('data').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FireStore Connection'),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
            child: Column(
              key: _formKey,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () async {}, child: const Text('Submit')),
                    ElevatedButton(
                      onPressed: deleteData,
                      child: const Text('Delete'),
                    ),
                    ElevatedButton(
                      onPressed: addData,
                      child: Text('Add Data'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          fetechData;
                        },
                        child: const Text('Fetch Data'))
                  ],
                ),
                ElevatedButton(onPressed: () {}, child: const Text('Get Data')),
                Container(
                  height: 400,
                  // width: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: user,
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot,
                    ) {
                      if (!snapshot.hasData) {
                        return const Text('Loading');
                      }
                      return ListView(
                        children: snapshot.data!.docs.map((document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return ListTile(
                            title: Text(data['Name']),
                            subtitle: Text(data['age']),
                          );
                        }).toList(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
