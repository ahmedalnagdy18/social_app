import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class FirebasePostDataSource {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;
  final FirebaseAuth auth;

  FirebasePostDataSource(
      {required this.firestore, required this.storage, required this.auth});

  Future<void> addPost(Map<String, dynamic> postMap) async {
    await firestore.collection('posts').add(postMap);
  }

  Future<String?> uploadImage(File file) async {
    var imagename = basename(file.path);
    var refStorage = storage.ref(imagename);
    await refStorage.putFile(file);
    return await refStorage.getDownloadURL();
  }
}
