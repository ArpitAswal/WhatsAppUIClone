import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Utils/preferences.dart';
import '../../Widgets/ui_helper.dart';
import '../Home/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.phoneCode});

  final String phoneCode;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();

  File? pickedImg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            UiHelper.customText(
                text: "Profile info",
                fontSize: 20,
                color: const Color(0XFF00A884),
                fntWt: FontWeight.bold),
            const SizedBox(
              height: 30,
            ),
            UiHelper.customText(
                text: "Please provide your name and an optional", fontSize: 14),
            UiHelper.customText(text: "profile photo", fontSize: 14),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                _imageOptions(context: context);
              },
              child: pickedImg == null
                  ? CircleAvatar(
                      radius: 80,
                      backgroundColor: const Color(0XFFD9D9D9),
                      child: Image.asset(
                        "assets/images/camera.png",
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    )
                  : CircleAvatar(
                      radius: 80,
                      backgroundImage: FileImage(pickedImg!),
                    ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                keyboardType: TextInputType.name,
                controller: nameController,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: "Type your name here",
                    hintStyle: TextStyle(color: Color(0XFF5E5E5E)),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF05AA82))),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF05AA82))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF05AA82)))),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: UiHelper.customButton(
          callback: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false);
            Preferences.userSaved();
            Preferences.saveUserInfo(
                img: pickedImg,
                name: nameController.text,
                phoneCode: widget.phoneCode);
          },
          btnLabel: "Next"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _imageOptions({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () async {
                  getImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () async {
                  getImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    try {
      final photo = await ImagePicker().pickImage(source: img);
      if (photo == null) return;
      final tempImg = File(photo.path);
      setState(() {
        pickedImg = tempImg;
      });
    } catch (ex) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(ex.toString()),
        backgroundColor: const Color(0XFF00A884),
      ));
    } finally {
      Navigator.of(context).pop();
    }
  }
}
