class StatusData {
  final String name;
  final String time;
  final String? avatar;

  StatusData({required this.name, required this.time, this.avatar});
}

List<StatusData> recentStatus = [
  StatusData(
    name: 'Michael',
    time: "Today,10:20 pm",
    avatar: "assets/images/usersAvatar/user1.png",
  ),
  StatusData(
    name: 'Rachel',
    time: "Today,14:23 pm",
    avatar: "assets/images/usersAvatar/user3.png",
  ),
  StatusData(
    name: 'Jessica',
    time: "Yesterday,23:20 pm",
    avatar: "assets/images/usersAvatar/user5.png",
  ),
  StatusData(
    name: 'Max William',
    avatar: "assets/images/usersAvatar/user6.png",
    time: "Yesterday,8:30 am",
  ),
];
