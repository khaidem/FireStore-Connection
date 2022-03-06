import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'datastore_state.dart';

class DatastoreCubit extends Cubit<DatastoreState> {
  DatastoreCubit() : super(const DatastoreState(status: StoreStatus.initial));

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('data');

  Future<void> deleteUser() {
    return collectionReference
        .doc('data')
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future<void> dataAdd() {
    return collectionReference
        .add({"Name": "denish", "age": "24"})
        .then((value) => print('ADD Data'))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future<void> addOn(String name, String age) {
    return collectionReference.add({
      'Name': name,
      'Age': age,
    });
  }
}
