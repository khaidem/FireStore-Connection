import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'datastore_state.dart';

class DatastoreCubit extends Cubit<DatastoreState> {
  DatastoreCubit() : super(const DatastoreState(status: StoreStatus.initial));
}
