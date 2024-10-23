import 'package:flutter/material.dart';

import '../Chats/chatsData.dart';
import '../Contact/contactData.dart';

class NewGroupScreen extends StatefulWidget {
  const NewGroupScreen({super.key});

  @override
  State<NewGroupScreen> createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  @override
  void initState() {
    super.initState();
    sortOrder();
  }

  List<ChatsData> gdata = [];
  final ScrollController _controllerOne = ScrollController();

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
            title: const Text(
              "New Group",
              style: TextStyle(color: Colors.white),
            ),
            subtitleTextStyle: const TextStyle(color: Colors.white),
            subtitle: gdata.isNotEmpty
                ? Text('${gdata.length} of ${saveContact.length} selected',
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w400))
                : const Text(
                    "Add participants",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF128C7E),
            onPressed: () {},
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )),
        body: Stack(children: [
          ListView.builder(
              controller: _controllerOne,
              itemCount: saveContact.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return SizedBox(
                    height: gdata.isNotEmpty ? 75 : 0,
                  );
                }
                return (!saveContact[index - 1].name.contains("You"))
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            if (saveContact[index - 1].select == true) {
                              gdata.remove(saveContact[index - 1]);
                              saveContact[index - 1].select = false;
                            } else {
                              gdata.add(saveContact[index - 1]);
                              saveContact[index - 1].select = true;
                            }
                          });
                        },
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: SizedBox(
                                height: 50,
                                width: 50,
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 23,
                                      backgroundImage: AssetImage(saveContact[
                                                  index - 1]
                                              .avatar ??
                                          'assets/images/usersAvatar/defaultUser.jpg'),
                                      backgroundColor: Colors.blueGrey[200],
                                    ),
                                    saveContact[index - 1].select
                                        ? const Positioned(
                                            bottom: 4,
                                            right: 4,
                                            child: CircleAvatar(
                                                radius: 8,
                                                backgroundColor: Colors.teal,
                                                child: Icon(Icons.check,
                                                    color: Colors.white,
                                                    size: 16)),
                                          )
                                        : Container()
                                  ],
                                )),
                          ),
                          title: Text(saveContact[index - 1].name),
                          subtitle: Text(saveContact[index - 1].lastMsg),
                        ))
                    : const SizedBox();
              }),
          gdata.isNotEmpty
              ? Column(
                  children: [
                    Container(
                        height: 75,
                        color: Colors.white,
                        child: ListView.builder(
                            itemCount: saveContact.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              if (saveContact[index].select == true) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      gdata.remove(saveContact[index]);
                                      saveContact[index].select = false;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0,
                                        bottom: 5.0,
                                        left: 10.0,
                                        right: 6.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Stack(
                                          children: [
                                            CircleAvatar(
                                              radius: 21,
                                              backgroundImage: AssetImage(
                                                  saveContact[index].avatar ??
                                                      'assets/images/usersAvatar/defaultUser.jpg'),
                                              backgroundColor: Colors.white,
                                            ),
                                            Positioned(
                                              bottom: 1,
                                              right: 1,
                                              child: CircleAvatar(
                                                  radius: 7,
                                                  backgroundColor:
                                                      Colors.blueGrey[200],
                                                  child: const Icon(Icons.clear,
                                                      color: Colors.white,
                                                      size: 12)),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          saveContact[index].name,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            })),
                    const Divider(thickness: 1),
                  ],
                )
              : Container()
        ]));
  }
}
