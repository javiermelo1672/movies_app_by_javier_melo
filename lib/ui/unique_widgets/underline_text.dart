import 'package:flutter/material.dart';
import 'package:leal_test_by_javier_melo/app/settings/app_colors.dart';

class UnderlineText extends StatelessWidget {
  final String? text;
  final Color? color;
  final Function? ontap;
  final double? fontSize;
  const UnderlineText(
      {Key? key, this.color, this.ontap, this.text, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap?.call();
      },
      child: Text(
        text ?? "",
        style: TextStyle(
          color: color ?? blackColor,
          decoration: TextDecoration.underline,
          fontSize: fontSize ?? 17.0,
        ),
      ),
    );
  }
}
