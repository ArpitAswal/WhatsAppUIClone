
import '../../../Utils/preferences.dart';

class ChatsData {
  String name;
  String lastMsg;
  int pendingMsg;
  String lastSeen;
  String date;
  String? avatar;
  bool select;

  ChatsData({
    required this.name,
    required this.lastMsg,
    required this.pendingMsg,
    required this.lastSeen,
    required this.date,
    required this.avatar,
    required this.select,
  });
}

List<ChatsData> chatsDataList = <ChatsData>[
  ChatsData(
      name: 'Michael',
      lastMsg: "What's Up",
      pendingMsg: 1,
      lastSeen: "12:30 am",
      date: "20/10/2023",
      avatar: "assets/images/usersAvatar/user1.png",
      select: false),
  ChatsData(
      name: 'Rachel',
      lastMsg: "Hey",
      pendingMsg: 0,
      lastSeen: "9:00 am",
      date: "22/10/2023",
      avatar: "assets/images/usersAvatar/user3.png",
      select: false),
  ChatsData(
      name: 'Jessica',
      lastMsg: "I am waiting",
      pendingMsg: 3,
      lastSeen: "2:00 pm",
      date: "21/11/2023",
      avatar: "assets/images/usersAvatar/user5.png",
      select: false),
  ChatsData(
      name: 'Max William',
      lastMsg: "where have you been",
      pendingMsg: 5,
      lastSeen: "6:00 pm",
      date: "22/10/2023",
      avatar: "assets/images/usersAvatar/user6.png",
      select: false),
  ChatsData(
      name: 'John Doe',
      lastMsg: "bye!",
      pendingMsg: 0,
      lastSeen: "10:00 am",
      date: "20/10/2023",
      avatar: null,
      select: false),
];

Future<ChatsData> getAuthUserInfo() async {
  List<String> user = await Preferences.getUserInfo();
  return ChatsData(
      name: (user[0].isEmpty) ? "${user[2]} (You)" : "${user[0]} (You)",
      lastMsg: "Hey",
      pendingMsg: 2,
      lastSeen: "12:00 am",
      date: "20/10/2023",
      avatar: user[1].isNotEmpty ? user[1] : null,
      select: false);
}

sortDate() {
  chatsDataList.sort((a, b) {
    DateTime dateA = _convertStringToDate(a.date);
    DateTime dateB = _convertStringToDate(b.date);

    return dateB.compareTo(dateA);
  });
}

// Helper function to convert from 'dd/MM/yyyy' to 'yyyy-MM-dd'
DateTime _convertStringToDate(String date) {
  List<String> parts = date.split('/'); // Split by '/'
  String formattedDate =
      '${parts[2]}-${parts[1]}-${parts[0]}'; // Reformat to 'yyyy-MM-dd'

  return DateTime.parse(formattedDate); // Parse into DateTime
}
