import 'package:flutter/material.dart';

import '../../../Widgets/ui_helper.dart';
import 'callData.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  void initState() {
    super.initState();
    sortCallDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0XFF008665),
        onPressed: () {},
        child: const Icon(
          Icons.add_call,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 75,
            width: MediaQuery.of(context).size.width,
            child: const ListTile(
              leading: CircleAvatar(
                radius: 23,
                backgroundColor: Color(0XFF008665),
                child: Icon(
                  Icons.link,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: Text(
                'Create call link',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                'Share a link for your WhatsApp call',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: UiHelper.customText(
                text: "Recent", fontSize: 18, align: TextAlign.start),
          ),
          for (var value in callsDataList) callStatus(value),
          const Divider(),
          SizedBox(
            height: 190,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock, color: Colors.black54, size: 14),
                RichText(
                    text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                        text: "Your personal calls are ",
                        style: TextStyle(color: Colors.grey[600])),
                    const TextSpan(
                        text: "end-to-end encrypted",
                        style: TextStyle(color: Colors.teal))
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget callStatus(CallData value) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(
            value.avatar ?? 'assets/images/usersAvatar/defaultUser.jpg'),
      ),
      title: UiHelper.customText(
          text: value.name,
          fontSize: 16,
          fntWt: FontWeight.bold,
          align: TextAlign.start),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          value.callType,
          Expanded(
            child: UiHelper.customText(
                text: value.time, align: TextAlign.start, fontSize: 14),
          )
        ],
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.call,
            color: Color(0XFF00A884),
          )),
    );
  }
}
