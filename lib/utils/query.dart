import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentSnapshot> queryToSingle(Query query) async {
  QuerySnapshot snapshot = await query.getDocuments();
  try {
    return snapshot.documents.first;
  } on StateError {
    return null;
  }
}
