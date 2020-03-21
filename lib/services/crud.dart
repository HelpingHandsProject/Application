
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CRUDMethods{
  bool isLoggedIn(){
    if(FirebaseAuth.instance.currentUser() != null)
      return true;
    else
      return false;
}

Future<void> addDataToDB(String key, data) async{
    if(isLoggedIn()){
      Firestore.instance.collection(key).add(data).catchError((e) {});
    }else{
      print("user not logged in.");
    }
}

}