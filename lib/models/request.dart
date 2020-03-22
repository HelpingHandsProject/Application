import 'package:cloud_firestore/cloud_firestore.dart';

class Request {
  String requestId;
  String ownerId;
  String chatId;
  List<String> helperIds;
  int helpersNeeded;
  String title;
  String description;
  String address;
  RequestStatus requestStatus;
  List<Days> weekDaysRepeating; // 0 = Monday, 6 = Sunday
  DateTime dueDate;
  DocumentReference reference;

  Request(this.helpersNeeded, this.title, this.description, this.address,
      this.requestStatus, this.weekDaysRepeating, this.dueDate);

  Request.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map["requestId"] != null),
        assert(map["ownerId"] != null),
        assert(map["chatId"] != null),
        assert(map["helperIds"] != null),
        assert(map["helpersNeeded"] != null),
        assert(map["title"] != null),
        assert(map["description"] != null),
        assert(map["address"] != null),
        assert(map["requestStatus"] != null),
        assert(map["weekDaysRepeating"] != null),
        assert(map["dueDate"] != null),
        requestId = map["requestId"],
        chatId = map["chatId"],
        ownerId = map["ownerId"],
        helperIds = map["helperIds"],
        helpersNeeded = map["helpersNeeded"],
        title = map["title"],
        description = map["description"],
        address = map["address"],
        requestStatus = map["requestStatus"],
        weekDaysRepeating = map["weekDaysRepeating"],
        dueDate = map["dueDate"];

  Request.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}

enum RequestStatus { open, active, closed }
enum Days { monday, tuesday, wednesday, thursday, friday, saturday, sunday }
