import 'dart:io';

import 'package:flutter/material.dart';

import '../../../Widgets/ui_helper.dart';
import '../Chats/chatsData.dart';
import '../Group/newGroup_screen.dart';
import 'contactData.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  late ChatsData user;

  @override
  void initState() {
    super.initState();
    sortOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white)),
        titleSpacing: 0.0,
        title: ListTile(
          title: UiHelper.customText(
              text: "Select Contact",
              fontSize: 16,
              color: Colors.white,
              align: TextAlign.start),
          subtitle: UiHelper.customText(
              text: "${saveContact.length.toString()} contacts",
              fontSize: 12,
              color: Colors.white,
              align: TextAlign.start),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          PopupMenuButton(
              iconColor: Colors.white,
              color: Colors.white,
              onSelected: (value) {},
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                      value: "Invite a friend", child: Text("Invite a friend")),
                  const PopupMenuItem(
                      value: "Contacts", child: Text("Contacts")),
                  const PopupMenuItem(value: "Refresh", child: Text("Refresh")),
                  const PopupMenuItem(value: "Help", child: Text("Help")),
                ];
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const CircleAvatar(
                radius: 20,
                foregroundColor: Colors.white,
                backgroundColor: Color(0XFF008665),
                child: Icon(Icons.group),
              ),
              title: const Text(
                'New group',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const NewGroupScreen()));
              },
            ),
            const ListTile(
              leading: CircleAvatar(
                radius: 20,
                foregroundColor: Colors.white,
                backgroundColor: Color(0XFF008665),
                child: Icon(Icons.person_add),
              ),
              title: Text(
                'New contact',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const ListTile(
              leading: CircleAvatar(
                radius: 20,
                foregroundColor: Colors.white,
                backgroundColor: Color(0XFF008665),
                child: Icon(Icons.groups),
              ),
              title: Text(
                'New community',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, top: 10.0),
              child: Text(
                'Contacts on Whatsapp',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 8),
            for (var value in saveContact)
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                leading: CircleAvatar(
                  backgroundImage:
                      (value.avatar == null || value.avatar!.isEmpty)
                          ? const AssetImage(
                              "assets/images/usersAvatar/defaultUser.jpg")
                          : (value.avatar!.contains('data'))
                              ? FileImage(File(value.avatar!))
                              : AssetImage(value.avatar!),
                ),
                title: UiHelper.customText(
                    text: value.name,
                    fontSize: 16,
                    fntWt: FontWeight.bold,
                    color: const Color(0XFF000000)),
                subtitle:
                    UiHelper.customText(text: value.lastMsg, fontSize: 14),
              ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, top: 10.0),
              child: Text(
                'Invite to Whatsapp',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            for (var value in extraContact)
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(value.avatar ??
                      "assets/images/usersAvatar/defaultUser.jpg"),
                ),
                title: UiHelper.customText(
                    text: value.name,
                    fontSize: 16,
                    fntWt: FontWeight.bold,
                    color: const Color(0XFF000000)),
                trailing: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Invite',
                    style: TextStyle(color: Color(0XFF008665), fontSize: 14),
                  ),
                ),
              ),
            const ListTile(
              leading: CircleAvatar(
                foregroundColor: Colors.black45,
                backgroundColor: Colors.black12,
                child: Icon(Icons.share),
              ),
              title: Text(
                'Share invite link',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              //iconColor: Colors.black54
            ),
            const ListTile(
              leading: CircleAvatar(
                  foregroundColor: Colors.black45,
                  backgroundColor: Colors.black12,
                  child: Icon(Icons.question_mark)),
              title: Text(
                'Contacts help',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              //        iconColor: Colors.black54
            )
          ],
        ),
      ),
    );
  }
}
