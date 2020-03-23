import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentSnapshot> queryToSingle(Query query) async {
  QuerySnapshot snapshot = await query.getDocuments();
  return snapshot.documents.first;
}
