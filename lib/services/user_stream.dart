import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helping_hands/constants/magic_strings.dart';
import 'package:helping_hands/models/user.dart';
import 'package:helping_hands/services/auth.dart';
import 'package:helping_hands/utils/query.dart';

class UserStream {
  StreamController<User> controller;
  StreamSubscription<FirebaseUser> fbSubscription;
  StreamSubscription<DocumentSnapshot> userSubscription;

  UserStream() {
    controller = StreamController<User>.broadcast(onListen: () {
      fbSubscription = AuthService().firebaseUser.listen((firebaseUser) async {
        if (firebaseUser != null) {
          String uid = firebaseUser.uid;
          Query query = Firestore.instance
              .collection(userChannel)
              .where("uid", isEqualTo: uid);
          DocumentSnapshot snapshot = await queryToSingle(query);

          // Ensure we are not leaking memory
          userSubscription?.cancel();
          userSubscription = snapshot.reference.snapshots().listen((userData) {
            User user = User.fromSnapshot(userData);
            if (user != null) {
              controller.add(user);
            } else {
              controller.add(User.undefined());
            }
          });
        } else {
          userSubscription?.cancel();
          controller.add(null);
        }
      });
    }, onCancel: () {
      fbSubscription.cancel();
      userSubscription.cancel();
    });
  }

  Stream<User> get userStream {
    return controller.stream;
  }

  void cancel() {
    controller.close();
  }
}
