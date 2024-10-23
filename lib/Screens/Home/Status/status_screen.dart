import 'dart:io';

import 'package:flutter/material.dart';
import 'package:whatsapp/Screens/Home/Status/statusData.dart';

import '../../../Utils/preferences.dart';
import '../../../Widgets/ui_helper.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  bool recentStatusHide = false;
  bool viewedStatusHide = false;
  late List<String>? userInfo;

  @override
  void initState() {
    super.initState();
    userInfo = null;
    fetchUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: ListTile(
                  leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: (userInfo == null ||
                                    userInfo![1].isEmpty)
                                ? const AssetImage(
                                    "assets/images/usersAvatar/defaultUser.jpg")
                                : FileImage(File(userInfo![1])),
                            backgroundColor: Colors.white,
                          ),
                          const Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.green,
                                child: Icon(Icons.add,
                                    color: Colors.white, size: 15)),
                          ),
                        ],
                      )),
                  title: const Text('My status',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  subtitle: const Text('Tap to add status here',
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UiHelper.customText(
                      text: "Recent status",
                      fontSize: 16,
                      align: TextAlign.start,
                      fntWt: FontWeight.w500),
                  IconButton(
                    color: const Color(0XFF5E5E5E),
                    onPressed: () {
                      setState(() {
                        recentStatusHide = !recentStatusHide;
                      });
                    },
                    icon: const Icon(Icons.arrow_drop_down),
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 8.0),
                  )
                ],
              ),
            ),
            if (!recentStatusHide)
              for (var value in recentStatus) status(statusData: value),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UiHelper.customText(
                      text: "Viewed status",
                      fontSize: 16,
                      align: TextAlign.start,
                      fntWt: FontWeight.w500),
                  IconButton(
                    color: const Color(0XFF5E5E5E),
                    onPressed: () {
                      setState(() {
                        viewedStatusHide = !viewedStatusHide;
                      });
                    },
                    icon: const Icon(Icons.arrow_drop_down),
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 8.0),
                  )
                ],
              ),
            ),
            if (!viewedStatusHide)
              for (var value in recentStatus) status(statusData: value),
            const Divider(),
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock, color: Colors.black54, size: 14),
                  RichText(
                      //textAlign: TextAlign.center,
                      text: TextSpan(
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(
                          text: "Your status updates are ",
                          style: TextStyle(color: Colors.grey[600])),
                      const TextSpan(
                          text: "end-to-end encrypted",
                          style: TextStyle(color: Colors.teal))
                    ],
                  )),
                ],
              ),
            ),
          ]),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.white70,
              elevation: 9,
              child: Container(
                padding: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(60),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffE1E8EB).withOpacity(0.35),
                      spreadRadius: 8,
                      blurRadius: 4,
                      offset: const Offset(1, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.edit,
                  color: Colors.black54,
                  size: 23,
                  shadows: [
                    Shadow(
                      color: Color(0xffE1E8EB),
                      offset: Offset(0.2, 0.5),
                      blurRadius: 5.0,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              backgroundColor: const Color(0XFF008665),
              onPressed: () {},
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
          ],
        ));
  }

  Widget status({required StatusData statusData}) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
      leading: CircleAvatar(
        radius: 23,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(
            statusData.avatar ?? 'assets/images/usersAvatar/defaultUser.jpg'),
      ),
      title: UiHelper.customText(
          text: statusData.name,
          fontSize: 16,
          fntWt: FontWeight.bold,
          align: TextAlign.start),
      subtitle: UiHelper.customText(
          text: statusData.time, fontSize: 14, align: TextAlign.start),
    );
  }

  Future<void> fetchUserInfo() async {
    userInfo = await Preferences.getUserInfo();
    setState(() {});
  }
}
