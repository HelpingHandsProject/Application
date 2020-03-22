import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helping_hands/constants/magic_strings.dart';

class Request {
  String requestId;
  String ownerId;
  String chatId;
  List<String> helperIds;
  int helpersNeeded;
  String title;
  String description;
  String address;
  GeoPoint location;
  RequestStatus requestStatus;
  List<Days> weekDaysRepeating; // 0 = Monday, 6 = Sunday
  DateTime dueDate;
  DocumentReference reference;

  Request(this.helpersNeeded, this.title, this.description, this.address,
      this.requestStatus, this.weekDaysRepeating, this.dueDate);

  Map<String, dynamic> toMap() => {
        requestIdStr: requestId,
        ownerIdStr: ownerId,
        chatIdStr: chatId,
        helperIdsStr: helperIds,
        helpersNeededStr: helpersNeeded,
        titleStr: title,
        descriptionStr: description,
        addressStr: address,
        requestStatusStr: requestStatus,
        weekDaysRepeatingStr: weekDaysRepeating,
        dueDateStr: dueDate
      };

  Request.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map[requestIdStr] != null),
        assert(map[ownerIdStr] != null),
        assert(map[chatIdStr] != null),
        assert(map[helperIdsStr] != null),
        assert(map[helpersNeededStr] != null),
        assert(map[titleStr] != null),
        assert(map[descriptionStr] != null),
        assert(map[addressStr] != null),
        assert(map[requestStatusStr] != null),
        assert(map[weekDaysRepeatingStr] != null),
        assert(map[dueDateStr] != null),
        requestId = map[requestIdStr],
        ownerId = map[ownerIdStr],
        chatId = map[chatIdStr],
        helperIds = map[helperIdsStr],
        helpersNeeded = map[helpersNeededStr],
        title = map[titleStr],
        description = map[descriptionStr],
        address = map[addressStr],
        requestStatus = map[requestStatusStr],
        weekDaysRepeating = map[weekDaysRepeatingStr],
        dueDate = map[dueDateStr];

  Request.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}

enum RequestStatus { open, active, closed }
enum Days { monday, tuesday, wednesday, thursday, friday, saturday, sunday }
