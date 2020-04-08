import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helping_hands/constants/magic_strings.dart';
import 'package:helping_hands/models/baseModel.dart';

class Chat implements BaseModel {
  String chatId;
  List<String> participantIds;
  List<String> openRequestIds;
  DocumentReference reference;

  Chat(this.participantIds);

  @override
  String getId() {
    return chatId;
  }

  @override
  Map<String, dynamic> toMap() => {
        chatIdStr: chatId,
        participantIdsStr: participantIds,
        openRequestIdsStr: openRequestIds
      };

  @override
  Chat.fromMap(Map<String, dynamic> map, this.reference)
      : assert(map[chatIdStr] != null),
        assert(map[participantIdsStr] != null),
        assert(map[openRequestIdsStr] != null),
        chatId = map[chatIdStr],
        participantIds = map[participantIdsStr],
        openRequestIds = map[openRequestIdsStr];

  static BaseModel fromSnapshot(DocumentSnapshot snapshot) {
    return Chat.fromMap(snapshot.data, snapshot.reference);
  }
}
