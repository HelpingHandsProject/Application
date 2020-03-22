import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helping_hands/models/request.dart';
import 'package:helping_hands/models/user.dart';
import 'package:helping_hands/utils/type.dart';

import 'chat.dart';
import 'chatMessage.dart';

abstract class BaseModel {
  DocumentReference reference;

  String getId();

  Map<String, dynamic> toMap();

  BaseModel fromSnapshot(DocumentSnapshot snapshot) {
    Type initialiserType = typeof<BaseModel>();
    switch (initialiserType) {
      case Chat:
        return Chat.fromMap(snapshot.data, snapshot.reference);
      case ChatMessage:
        return ChatMessage.fromMap(snapshot.data, snapshot.reference);
      case Request:
        return Request.fromMap(snapshot.data, snapshot.reference);
      case User:
        return User.fromMap(snapshot.data, snapshot.reference);
      default:
        throw ArgumentError(
            "BaseModel/fromSnapshot: Unknown Type: $initialiserType");
    }
  }
}
