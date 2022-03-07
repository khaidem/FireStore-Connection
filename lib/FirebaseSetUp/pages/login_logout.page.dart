import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScreenFireStore extends StatefulWidget {
  const ScreenFireStore({Key? key}) : super(key: key);

  @override
  State<ScreenFireStore> createState() => _ScreenFireStoreState();
}

class _ScreenFireStoreState extends State<ScreenFireStore> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> user =
        FirebaseFirestore.instance.collection('data').snapshots();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Data'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: user,
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['Name']),
                subtitle: Text(data['Age'].toString()),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
