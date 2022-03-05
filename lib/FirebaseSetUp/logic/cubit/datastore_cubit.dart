import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'datastore_state.dart';

class DatastoreCubit extends Cubit<DatastoreState> {
  DatastoreCubit() : super(DatastoreState(status: StoreStatus.initial));
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('data');
}
