import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helping_hands/models/baseModel.dart';
import 'package:helping_hands/models/chat.dart';
import 'package:helping_hands/models/chatMessage.dart';
import 'package:helping_hands/models/request.dart';
import 'package:helping_hands/models/user.dart';
import 'package:helping_hands/utils/type.dart';

import 'auth.dart';

class CRUD {
  static Future<DocumentReference> add<T extends BaseModel>(T object) async {
    if (!AuthService.isLoggedIn()) {
      print("CRUD/create: User is not logged in!");
      return null;
    }
    String collectionName = getCollectionName<T>();
    return await Firestore.instance
        .collection(collectionName)
        .add(object.toMap());
  }

  static Future<void> update<T extends BaseModel>(T object) async {
    if (!AuthService.isLoggedIn()) {
      print("CRUD/create: User is not logged in!");
      return null;
    }
    await object.reference.updateData(object.toMap());
  }

  static Future<void> delete<T extends BaseModel>(T object) async {
    if (!AuthService.isLoggedIn()) {
      print("CRUD/create: User is not logged in!");
      return null;
    }
    await object.reference.delete();
  }

  static String getCollectionName<T>() {
    Type callType = typeof<T>();
    switch (callType) {
      case Chat:
        return "chat";
      case ChatMessage:
        return "chatMessage";
      case Request:
        return "request";
      case User:
        return "user";
      default:
        print("CRUD/create: Unexpected type: $callType");
        return null;
    }
  }
}
