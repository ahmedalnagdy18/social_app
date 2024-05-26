import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Repository {
  Stream<QuerySnapshot> getAllPost();
  Stream<QuerySnapshot> getAllSory();
}
