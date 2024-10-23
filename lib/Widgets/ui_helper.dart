import 'package:flutter/material.dart';

class UiHelper {
  static customButton(
      {required VoidCallback callback, required String btnLabel}) {
    return SizedBox(
      height: 40,
      width: 300,
      child: ElevatedButton(
          onPressed: () {
            callback();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFF00A884),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40))),
          child: Text(
            btnLabel,
            style: const TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
          )),
    );
  }

  static customText(
      {required String text,
      required double fontSize,
      TextAlign? align,
      Color? color,
      FontWeight? fntWt,
      double? letterSpace}) {
    return Text(
      text,
      softWrap: true,
      textAlign: align ?? TextAlign.start,
      style: TextStyle(
          fontSize: fontSize,
          color: color ?? const Color(0XFF5E5E5E),
          fontWeight: fntWt ?? FontWeight.w400,
          letterSpacing: letterSpace ?? 0),
    );
  }

  static getWidthSpace(double? widthPixel, {required BuildContext ctx}) {
    double widthFactor = (widthPixel ?? 1) / MediaQuery.of(ctx).size.width;
    return MediaQuery.of(ctx).size.width * widthFactor;
  }
}
