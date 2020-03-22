import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helping_hands/constants/magic_strings.dart';

class Chat {
  String chatId;
  List<String> participantIds;
  List<String> openRequestIds;
  DocumentReference reference;

  Chat(this.participantIds);

  Map<String, dynamic> toMap() => {
        chatIdStr: chatId,
        participantIdsStr: participantIds,
        openRequestIdsStr: openRequestIds
      };

  Chat.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map[chatIdStr] != null),
        assert(map[participantIdsStr] != null),
        assert(map[openRequestIdsStr] != null),
        chatId = map[chatIdStr],
        participantIds = map[participantIdsStr],
        openRequestIds = map[openRequestIdsStr];

  Chat.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
