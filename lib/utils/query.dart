import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentSnapshot> queryToSingle(Query query) async {
  QuerySnapshot snapshot = await query.getDocuments();

  if (snapshot.documents.length > 0) {
    return snapshot.documents.first;
  } else {
    return null;
  }
}
