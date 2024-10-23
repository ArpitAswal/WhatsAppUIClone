import 'dart:io';

import 'package:flutter/material.dart';

import '../../../Widgets/ui_helper.dart';
import '../../Message/message_screen.dart';
import '../Contact/contacts_screen.dart';
import 'chatsData.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {

  late ChatsData user;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    super.dispose();
    chatsDataList.remove(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0XFF008665),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ContactsScreen()));
        },
        child: const Icon(
          Icons.message,
          color: Colors.white,
          size: 24,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: chatsDataList.length,
                itemBuilder: (context, i) => ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 0.0),
                      leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: (chatsDataList[i].avatar == null ||
                                  chatsDataList[i].avatar!.isEmpty)
                              ? const AssetImage(
                                  "assets/images/usersAvatar/defaultUser.jpg")
                              : (chatsDataList[i].avatar!.contains('data'))
                                  ? FileImage(File(chatsDataList[i].avatar!))
                                  : AssetImage(chatsDataList[i].avatar!)),
                      title: UiHelper.customText(
                          text: chatsDataList[i].name,
                          fontSize: 14,
                          align: TextAlign.start,
                          fntWt: FontWeight.w700,
                          color: Colors.black),
                      subtitle: Row(
                        children: [
                          const Icon(Icons.done_all),
                          const SizedBox(width: 4.0),
                          Expanded(
                              child: UiHelper.customText(
                                  text: chatsDataList[i].lastMsg,
                                  align: TextAlign.start,
                                  fontSize: 13,
                                  color: const Color(0XFF889095)))
                        ],
                      ),
                      trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            UiHelper.customText(
                                text: chatsDataList[i].date,
                                fontSize: 12,
                                color: (chatsDataList[i].pendingMsg > 0)
                                    ? const Color(0XFF026500)
                                    : const Color(0XFF889095)),
                            (chatsDataList[i].pendingMsg > 0)
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 2.5),
                                    child: CircleAvatar(
                                      radius: 8,
                                      backgroundColor: const Color(0XFF036A01),
                                      child: UiHelper.customText(
                                          text: chatsDataList[i]
                                              .pendingMsg
                                              .toString(),
                                          fontSize: 12,
                                          color: const Color(0XFFFFFFFF)),
                                    ),
                                  )
                                : const SizedBox()
                          ]),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MessageScreen(user: chatsDataList[i])));
                      },
                    )),
          ),
        ],
      ),
    );
  }

  void fetchData() async {
    user = await getAuthUserInfo();
    chatsDataList.add(user);
    sortDate();
    setState(() {});
  }
}
