import 'package:flutter/material.dart';

import '../../../Widgets/ui_helper.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        Image.asset(
          'assets/images/boarding.png',
          height: 120,
          width: 120,
        ),
        const SizedBox(
          height: 30,
        ),
        UiHelper.customText(
            text: "Introducing Communities",
            fontSize: 24,
            fntWt: FontWeight.w700,
            color: Colors.black),
        const SizedBox(
          height: 12,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0),
            child: UiHelper.customText(
                text:
                    "Easily organise your related groups and send announcements. Now,your communities,like neighbourhoods or schools, can have their own space",
                fontSize: 16,
                align: TextAlign.center,
                color: const Color(0XFF889095))),
        const SizedBox(
          height: 30,
        ),
        Container(
            decoration: const BoxDecoration(
              color: Color(0XFF008665),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            height: 40,
            width: 300,
            alignment: Alignment.center,
            child: const Text('Start your community',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600))),
      ],
    ));
  }
}
