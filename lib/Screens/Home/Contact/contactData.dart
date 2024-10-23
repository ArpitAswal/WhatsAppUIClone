import '../Chats/chatsData.dart';

List<ChatsData> saveContact = List.from(chatsDataList);

List<ChatsData> extraContact = [
  ChatsData(
      name: 'Jack Wilson',
      lastMsg: "What's Up",
      pendingMsg: 1,
      lastSeen: "12:30 am",
      date: "20/10/2023",
      avatar: "assets/images/usersAvatar/user1.png",
      select: false),
  ChatsData(
      name: 'Robin',
      lastMsg: "What's Up",
      pendingMsg: 1,
      lastSeen: "12:30 am",
      date: "20/10/2023",
      avatar: "assets/images/usersAvatar/user5.png",
      select: false),
  ChatsData(
      name: 'Jordan',
      lastMsg: "What's Up",
      pendingMsg: 1,
      lastSeen: "12:30 am",
      date: "20/10/2023",
      avatar: "assets/images/usersAvatar/user6.png",
      select: false),
];

var allContact = List.from(saveContact).addAll(extraContact);

void sortOrder() {
  saveContact.sort((a, b) => (a.name.compareTo(b.name)));
  for (int i = 0; i < saveContact.length; i++) {
    if (saveContact[i].name.contains("You")) {
      saveContact[i].lastMsg = 'Message yourself';
    } else {
      saveContact[i].lastMsg = 'Hye I am ${saveContact[i].name}';
    }
    extraContact.sort((a, b) => a.name.compareTo(b.name));
  }
}
