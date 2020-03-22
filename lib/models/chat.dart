import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  String chatId;
  List<String> participantIds;
  List<String> openRequestIds;
  DocumentReference reference;

  Chat(this.participantIds);

  Chat.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map["chatId"] != null),
        assert(map["participantIds"] != null),
        assert(map["openRequestIds"] != null),
        chatId = map["chatId"],
        participantIds = map["chaparticipantIdstId"],
        openRequestIds = map["openRequestIds"];

  Chat.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
