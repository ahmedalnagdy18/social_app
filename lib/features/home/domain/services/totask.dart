import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/features/home/data/model/api_model.dart';

List<ApiModel> totask(List<QueryDocumentSnapshot<Object?>> docs) {
  List<ApiModel> data = [];
  for (var element in docs) {
    data.add(ApiModel.fromSnapshot(element));
  }
  return data;
}
