part of 'datastore_cubit.dart';

enum StoreStatus {
  initial,
  loading,
  loaded,
  error,
}

class DatastoreState extends Equatable {
  const DatastoreState({required this.status});
  final StoreStatus status;

  @override
  List<Object> get props => [status];
}
