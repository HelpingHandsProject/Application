class Request {
  String requestId;
  String chatId;
  String ownerId;
  List<String> helperIds;
  int helpersNeeded;
  String title;
  String description;
  String address;
  RequestStatus requestStatus;
  List<int> weekDaysRepeating; // 0 = Monday, 6 = Sunday
  DateTime dueDate;
}

enum RequestStatus { open, active, closed }
