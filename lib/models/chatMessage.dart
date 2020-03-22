import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
  String messageId;
  String uid;
  DateTime timestamp;
  DateTime lastEdited;
  String requestId;
  String message;
  DocumentReference reference;

  ChatMessage(this.message, [this.requestId]);

  ChatMessage.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map["messageId"] != null),
        assert(map["uid"] != null),
        assert(map["timestamp"] != null),
        assert(map["lastEdited"] != null),
        assert(map["requestId"] != null),
        assert(map["message"] != null),
        messageId = map["messageId"],
        uid = map["uid"],
        timestamp = map["timestamp"],
        lastEdited = map["lastEdited"],
        requestId = map["requestId"],
        message = map["message"];

  ChatMessage.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
