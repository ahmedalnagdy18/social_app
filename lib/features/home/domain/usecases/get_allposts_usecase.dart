import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/features/home/domain/repositories/repository.dart';

class GetAllPostsUsecase {
  Repository repository;

  GetAllPostsUsecase({required this.repository});
  Future<Stream<QuerySnapshot<Object?>>> call() async {
    return repository.getAllPost();
  }
}
