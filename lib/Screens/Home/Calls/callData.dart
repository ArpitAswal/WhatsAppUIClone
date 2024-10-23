import 'package:flutter/material.dart';

class CallData {
  final String name;
  final String time;
  final String? avatar;
  final Icon callType;

  CallData(
      {required this.name,
      required this.time,
      this.avatar,
      required this.callType});

  static Icon callReceived = const Icon(
    Icons.call_received,
    size: 18,
    color: Colors.green,
  );
  static Icon callMissed = const Icon(
    Icons.call_missed,
    size: 18,
    color: Colors.red,
  );
}

List<CallData> callsDataList = [
  CallData(
    name: 'Michael',
    time: "28 February, 9:51 pm",
    callType: CallData.callReceived,
    avatar: "assets/images/usersAvatar/user1.png",
  ),
  CallData(
    name: 'Rachel',
    time: "26 February, 8:39 pm",
    callType: CallData.callMissed,
    avatar: "assets/images/usersAvatar/user3.png",
  ),
  CallData(
    name: 'Jessica',
    time: "26 February, 8:39 pm",
    callType: CallData.callReceived,
    avatar: "assets/images/usersAvatar/user5.png",
  ),
  CallData(
    name: 'Max William',
    time: "21 February, 8:15 pm",
    callType: CallData.callMissed,
    avatar: "assets/images/usersAvatar/user6.png",
  ),
  CallData(
    name: 'John Doe',
    time: "24 February, 12:12 am",
    callType: CallData.callMissed,
    avatar: null,
  ),
];

sortCallDate() {
  callsDataList.sort((a, b) {
    return (b.time).compareTo((a.time));
  });
}
