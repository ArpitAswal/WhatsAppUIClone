import 'package:flutter/material.dart';

import '../../Widgets/ui_helper.dart';
import 'Calls/calls_screen.dart';
import 'Chats/chats_screen.dart';
import 'Community/community_screen.dart';
import 'Status/status_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.groups),
              ),
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              )
            ],
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w600),
          ),
          toolbarHeight: 60,
          title: UiHelper.customText(
              text: "WhatsApp",
              fontSize: 20,
              color: Colors.white,
              fntWt: FontWeight.bold),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_sharp))
          ],
        ),
        body: const TabBarView(children: [
          CommunityScreen(),
          ChatsScreen(),
          StatusScreen(),
          CallsScreen()
        ]),
      ),
    );
  }
}
