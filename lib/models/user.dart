import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helping_hands/constants/magic_strings.dart';
import 'package:helping_hands/models/baseModel.dart';
import 'rating.dart';

class User implements BaseModel {
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

  String getId() {
    return uid;
  }

  Map<String, dynamic> toMap() => {
        uidStr: uid,
        requestIdsStr: requestIds,
        chatIdsStr: chatIds,
        deviceIdsStr: deviceIds,
        firstNameStr: firstName,
        lastNameStr: lastName,
        addressStr: address,
        profilePictureLinkStr: profilePictureLink,
        ratingsReceivedStr: ratingsReceived,
        ratingsGivenStr: ratingsGiven,
        thumbsUpGivenStr: thumbsUpGiven,
        thumbsDownGivenStr: thumbsDownGiven
      };

  User.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map[uidStr] != null),
        assert(map[requestIdsStr] != null),
        assert(map[chatIdsStr] != null),
        assert(map[deviceIdsStr] != null),
        assert(map[firstNameStr] != null),
        assert(map[lastNameStr] != null),
        assert(map[ratingsReceivedStr] != null),
        assert(map[ratingsGivenStr] != null),
        assert(map[thumbsUpGivenStr] != null),
        assert(map[thumbsDownGivenStr] != null),
        uid = map[uidStr],
        requestIds = map[requestIdsStr],
        chatIds = map[chatIdsStr],
        deviceIds = map[deviceIdsStr],
        firstName = map[firstNameStr],
        lastName = map[lastNameStr],
        address = map[profilePictureLinkStr],
        profilePictureLink = map[profilePictureLinkStr],
        ratingsReceived = map[ratingsReceivedStr],
        ratingsGiven = map[ratingsGivenStr],
        thumbsUpGiven = map[thumbsUpGivenStr],
        thumbsDownGiven = map[thumbsDownGivenStr];

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "User<$uid>";
}
