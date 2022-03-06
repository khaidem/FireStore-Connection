import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseconnectionsetup/FirebaseSetUp/logic/cubit/datastore_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FireStorePage extends StatefulWidget {
  const FireStorePage({Key? key}) : super(key: key);

  @override
  State<FireStorePage> createState() => _FireStorePageState();
}

class _FireStorePageState extends State<FireStorePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  // Map? data;
  // addData() {
  //   Map<String, dynamic> demoData = {
  //     "Name": "Another",
  //     "age": "25",
  //   };
  //   CollectionReference collectionReference =
  //       FirebaseFirestore.instance.collection('data');
  //   collectionReference.add(demoData);
  // }

  // fetechData() async {
  //   DocumentSnapshot varaible = await FirebaseFirestore.instance
  //       .collection('data')
  //       .doc('q1cBQnCbcajVN9h15zzq')
  //       .get();
  //   print(varaible['Name']);
  // }

  // deleteData() async {
  //   CollectionReference collectionReference =
  //       FirebaseFirestore.instance.collection('data');
  //   QuerySnapshot querySnapshot = await collectionReference.get();
  //   querySnapshot.docs[0].reference.delete();
  // }

  final Stream<QuerySnapshot> user =
      FirebaseFirestore.instance.collection('data').snapshots();

  Widget _buildList(QuerySnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.docs.length,
        itemBuilder: (context, index) {
          final doc = snapshot.docs[index];
          return Text('User name is ${doc['name']}');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FireStore Connection'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                icon: Icon(Icons.date_range),
                labelText: 'Age',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    context
                        .read<DatastoreCubit>()
                        .addOn(nameController.text, ageController.text);
                  },
                  child: const Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Delete'),
                ),
              ],
            ),
            // StreamBuilder<QuerySnapshot>(
            //     stream: user,
            //     builder: (context, snapshot) {
            //       if (!snapshot.hasData) return const LinearProgressIndicator();
            //       return Expanded(child: _buildList(snapshot.data!));
            //     }),
          ],
        ),
      ),
    );
  }
}
