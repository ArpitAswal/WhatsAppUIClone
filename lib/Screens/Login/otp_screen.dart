import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:whatsapp/Screens/Login/verification_screen.dart';

import '../../Widgets/ui_helper.dart';
import '../Profile/profile_screen.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen(this.phone, this.code, {super.key});

  final String phone;
  final String code;

  final OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: UiHelper.customText(
            text: "Verify $code $phone",
            fontSize: 16,
            fntWt: FontWeight.w700,
            color: const Color(0XFF00A884)),
        actions: [
          PopupMenuButton(
              onSelected: (value) {},
              color: Colors.grey,
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(value: "Help", child: Text("Help")),
                ];
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(side: BorderSide(color: Colors.white)),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        child: const Icon(Icons.cleaning_services),
        onPressed: () {
          otpController.clear();
        },
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              UiHelper.customText(
                  text: "Waiting to automatically detect an SMS sent to",
                  fontSize: 14,
                  letterSpace: UiHelper.getWidthSpace(1, ctx: context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' $code $phone.',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const VerificationScreen()),
                            (Route<dynamic> route) => false);
                      },
                      child: UiHelper.customText(
                          text: " Wrong number? ",
                          fontSize: 14,
                          letterSpace: UiHelper.getWidthSpace(1, ctx: context),
                          color: const Color(0xFF00A884)))
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              OTPTextField(
                  controller: otpController,
                  length: 6,
                  obscureText: true,
                  width: MediaQuery.of(context).size.width,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0XFF00A884)),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  otpFieldStyle: OtpFieldStyle(
                    borderColor: const Color(0XFF00A884),
                    enabledBorderColor: const Color(0XFF00A884),
                    focusBorderColor: const Color(0XFF00A884),
                  ),
                  onChanged: (pin) {},
                  onCompleted: (pin) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProfileScreen(phoneCode: "$code $phone"),
                        ));
                  }),
              const SizedBox(
                height: 20,
              ),
              Text('Enter 6-digit code',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.message,
                    color: Colors.teal,
                    size: 24,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  UiHelper.customText(
                      text: "Resend SMS",
                      fontSize: 14,
                      color: const Color(0XFF00A884))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1.5,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.call,
                    color: Colors.teal,
                    size: 24,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  UiHelper.customText(
                      text: "Call Me",
                      fontSize: 14,
                      color: const Color(0XFF00A884))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
