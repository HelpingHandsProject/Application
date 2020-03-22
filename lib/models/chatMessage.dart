import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helping_hands/constants/magic_strings.dart';

class ChatMessage {
  String messageId;
  String uid;
  DateTime created;
  DateTime lastEdited;
  String requestId;
  String message;
  DocumentReference reference;

  ChatMessage(this.message, [this.requestId]);

  Map<String, dynamic> toMap() => {
        messageIdStr: messageId,
        uidStr: uid,
        createdStr: created,
        lastEditedStr: lastEdited,
        requestIdStr: requestId,
        messageStr: message
      };

  ChatMessage.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map[messageIdStr] != null),
        assert(map[uidStr] != null),
        assert(map[createdStr] != null),
        assert(map[lastEditedStr] != null),
        assert(map[requestIdStr] != null),
        assert(map[messageStr] != null),
        messageId = map[messageIdStr],
        uid = map[uidStr],
        created = map[createdStr],
        lastEdited = map[lastEditedStr],
        requestId = map[requestIdStr],
        message = map[messageStr];

  ChatMessage.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
