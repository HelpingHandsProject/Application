import 'package:cloud_firestore/cloud_firestore.dart';
import 'rating.dart';

class User {
  String uid;
  List<String> requestIds;
  List<String> chatIds;
  List<String> deviceIds;
  String firstName;
  String lastName;
  String address; // Optional
  String profilePictureLink; // Optional
  List<Rating> ratingsReceived;
  List<Rating> ratingsGiven;
  int thumbsUpGiven;
  int thumbsDownGiven;
  DocumentReference reference;

  User(this.deviceIds, this.firstName, this.lastName, this.ratingsReceived,
      this.ratingsGiven, this.thumbsUpGiven, this.thumbsDownGiven,
      [this.address, this.profilePictureLink]);

  User.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map["uid"] != null),
        assert(map["requestIds"] != null),
        assert(map["chatIds"] != null),
        assert(map["deviceIds"] != null),
        assert(map["firstName"] != null),
        assert(map["lastName"] != null),
        assert(map["ratingsReceived"] != null),
        assert(map["ratingsGiven"] != null),
        assert(map["thumbsUpGiven"] != null),
        assert(map["thumbsDownGiven"] != null),
        uid = map["uid"],
        requestIds = map["requestIds"],
        chatIds = map["chatIds"],
        deviceIds = map["deviceIds"],
        firstName = map["firstName"],
        lastName = map["lastName"],
        address = map["address"],
        profilePictureLink = map["profilePictureLink"],
        ratingsReceived = map["ratingsReceived"],
        ratingsGiven = map["ratingsGiven"],
        thumbsUpGiven = map["thumbsUpGiven"],
        thumbsDownGiven = map["thumbsDownGiven"];

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "User<$uid>";
}
