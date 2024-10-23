import 'dart:async';

import 'package:flutter/material.dart';

import '../../Utils/preferences.dart';
import '../../Widgets/ui_helper.dart';
import '../Home/home_screen.dart';
import '../OnBoarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      bool b = await Preferences.userSignIn();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  (b) ? const HomeScreen() : const OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Image.asset("assets/images/whatsapp_icon.png")),
              UiHelper.customText(
                  text: "from",
                  fontSize: 14,
                  fntWt: FontWeight.bold,
                  color: Colors.grey),
              const SizedBox(height: 10),
              UiHelper.customText(
                  text: "FACEBOOK",
                  fontSize: 18,
                  fntWt: FontWeight.bold,
                  color: const Color(0XFF00A884)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
