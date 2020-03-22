import 'rating.dart';

class User {
  String uid;
  List<String> requestIds;
  List<String> chatIds;
  List<String> deviceIds;
  String firstName;
  String lastName;
  String address;
  String profilePictureLink;
  List<Rating> ratingsReceived;
  List<Rating> ratingsGiven;
  int thumbsUpGiven;
  int thumbsDownGiven;
}
