import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helping_hands/Constants/magic_strings.dart';
import 'package:helping_hands/models/baseModel.dart';
import 'package:helping_hands/models/chat.dart';
import 'package:helping_hands/models/chatMessage.dart';
import 'package:helping_hands/models/request.dart';
import 'package:helping_hands/models/user.dart';
import 'package:helping_hands/utils/query.dart';
import 'package:helping_hands/utils/type.dart';

import 'auth.dart';

class CRUD {
  static Future<DocumentReference> add<T extends BaseModel>(T object) async {
    if (!await AuthService.isLoggedIn()) {
      print("CRUD/add: User is not logged in!");
      return null;
    }
    String collectionName = getCollectionName<T>();
    Map<String, dynamic> converted = object.toMap();
    return await Firestore.instance.collection(collectionName).add(converted);
  }

  static Future<void> update<T extends BaseModel>(T object) async {
    if (!await AuthService.isLoggedIn()) {
      print("CRUD/update: User is not logged in!");
      return null;
    }

    await object.reference.updateData(object.toMap());
  }

  static Future<void> delete<T extends BaseModel>(T object) async {
    if (!await AuthService.isLoggedIn()) {
      print("CRUD/delete: User is not logged in!");
      return null;
    }
    await object.reference.delete();
  }

  static Future<User> getUserProfile() async {
    if (!await AuthService.isLoggedIn()) {
      print("CRUD/delete: User is not logged in!");
      return User(null, null, null, null, null, null, null, null);
    }

    User user = User(null, null, null, null, null, null, null, null);
    String uid = await AuthService.getUserId();
    Query query =
        Firestore.instance.collection(userChannel).where("uid", isEqualTo: uid);
    DocumentSnapshot snapshot = await queryToSingle(query);
    if (snapshot != null) {
      user = User.fromMap(snapshot.data, snapshot.reference);
    }
    return user;
  }

  void subscribeToDocumentChange<T extends BaseModel>(
      T document, void Function(T updatedDocument) onChange) {
    document.reference.snapshots().listen((snapshot) {
      document.toMap();
      T updatedDocument = document.fromSnapshot(snapshot);
      onChange(updatedDocument);
    });
  }

  static String getCollectionName<T>() {
    Type callType = typeof<T>();
    switch (callType) {
      case Chat:
        return chatChannel;
      case ChatMessage:
        return chatMessageChannel;
      case Request:
        return requestChannel;
      case User:
        return userChannel;
      default:
        print("CRUD/create: Unexpected type: $callType");
        return null;
    }
  }
}
