import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseModel {
  DocumentReference reference;

  String getId();
  Map<String, dynamic> toMap();
  BaseModel.fromMap(Map<String, dynamic> map, {DocumentReference reference});
  BaseModel.fromSnapshot(DocumentSnapshot snapshot);
}
