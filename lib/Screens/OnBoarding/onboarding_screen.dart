import 'package:flutter/Material.dart';

import '../../Widgets/ui_helper.dart';
import '../Login/verification_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
          height: height,
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 85),
              SizedBox(
                height: 250,
                width: 250,
                child: Image.asset(
                  "assets/images/boarding.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              UiHelper.customText(
                  text: "Welcome to WhatsApp",
                  fontSize: 20,
                  color: Colors.black),
              const SizedBox(height: 20),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: const Color(0XFF5E5E5E),
                      fontSize: 14,
                      letterSpacing: UiHelper.getWidthSpace(1, ctx: context),
                    ),
                    children: [
                      const TextSpan(text: "Read our"),
                      TextSpan(
                          text: " Privacy Policy. ",
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 14,
                              letterSpacing:
                                  UiHelper.getWidthSpace(1, ctx: context))),
                      const TextSpan(text: 'Tap "Agree and Continue"')
                    ],
                  )),
              RichText(
                  text: TextSpan(
                      text: 'to accept the',
                      style: TextStyle(
                        color: const Color(0XFF5E5E5E),
                        fontSize: 13,
                        letterSpacing: UiHelper.getWidthSpace(1, ctx: context),
                      ),
                      children: [
                    TextSpan(
                        text: " Terms of Services. ",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 13,
                            letterSpacing:
                                UiHelper.getWidthSpace(1, ctx: context)))
                  ])),
            ],
          )),
      floatingActionButton: UiHelper.customButton(
          callback: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const VerificationScreen()));
          },
          btnLabel: "Agree and Continue".toUpperCase()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
