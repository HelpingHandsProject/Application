import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helping_hands/constants/magic_strings.dart';
import 'package:helping_hands/models/baseModel.dart';
import 'package:helping_hands/utils/list.dart';
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

  User(
      this.uid,
      this.deviceIds,
      this.firstName,
      this.lastName,
      this.ratingsReceived,
      this.ratingsGiven,
      this.thumbsUpGiven,
      this.thumbsDownGiven,
      [this.address = "",
      this.profilePictureLink = ""]) {
    this.requestIds = new List<String>();
    this.chatIds = new List<String>();
  }

  User.undefined();

  bool isComplete() {
    return firstName != null && lastName != null;
  }

  @override
  String getId() {
    return uid;
  }

  @override
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

  @override
  User.fromMap(Map<String, dynamic> map, this.reference)
      : assert(mapIsValid(map)),
        uid = map[uidStr],
        requestIds = fromGenericList<String>(map[requestIdsStr]),
        chatIds = fromGenericList<String>(map[chatIdsStr]),
        deviceIds = fromGenericList<String>(map[deviceIdsStr]),
        firstName = map[firstNameStr],
        lastName = map[lastNameStr],
        address = map[profilePictureLinkStr],
        profilePictureLink = map[profilePictureLinkStr],
        ratingsReceived = fromGenericList<Rating>(map[ratingsReceivedStr]),
        ratingsGiven = fromGenericList<Rating>(map[ratingsGivenStr]),
        thumbsUpGiven = map[thumbsUpGivenStr],
        thumbsDownGiven = map[thumbsDownGivenStr];

  static BaseModel fromSnapshot(DocumentSnapshot snapshot) {
    if (snapshot != null && mapIsValid(snapshot.data)) {
      return User.fromMap(snapshot.data, snapshot.reference);
    } else {
      return null;
    }
  }

  static bool mapIsValid(Map<String, dynamic> map) {
    return map[uidStr] != null &&
        map[requestIdsStr] != null &&
        map[chatIdsStr] != null &&
        map[deviceIdsStr] != null &&
        map[firstNameStr] != null &&
        map[lastNameStr] != null &&
        map[ratingsReceivedStr] != null &&
        map[ratingsGivenStr] != null &&
        map[thumbsUpGivenStr] != null &&
        map[thumbsDownGivenStr] != null;
  }

  @override
  String toString() => "User<$uid>";
}
