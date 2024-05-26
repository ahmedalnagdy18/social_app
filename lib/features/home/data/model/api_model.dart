import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/features/home/domain/entites/entity.dart';

class ApiModel extends Entity {
  ApiModel({
    required super.url,
    super.description,
    super.id,
  });

  factory ApiModel.fromSnapshot(DocumentSnapshot map) {
    return ApiModel(
      id: map.id,
      url: map.get('url'),
      description: map.get('description'),
    );
  }
}
