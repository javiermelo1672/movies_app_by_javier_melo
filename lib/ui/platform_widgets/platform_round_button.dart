import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leal_test_by_javier_melo/utils/utils_methos.dart';
import '../no_unique_widgets_factory/factories/cupertino_widgets_factory.dart';
import '../no_unique_widgets_factory/factories/material_widgets_factory.dart';
import '../no_unique_widgets_factory/iwidgets_factory.dart';
import '../no_unique_widgets_factory/widgets/iactivity_indicator.dart';
import '../platform_widget.dart';

class PlatformRoundButton extends PlatformWidget<Widget, Widget> {
  final String? text;
  final VoidCallback? onPressed;
  final bool? isLoading;
  final bool isSecondary;
  final Color? color;
  final Color? textColor;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final GoogleFonts? font;
  final double? fontSize;

  PlatformRoundButton(
      {required this.onPressed,
      this.text,
      this.isLoading = false,
      this.isSecondary = false,
      this.color,
      this.textColor,
      this.child,
      this.padding,
      this.font,
      this.fontSize});

  final List<IWidgetsFactory> widgetsFactoryList = [
    MaterialWidgetsFactory(),
    CupertinoWidgetsFactory(),
  ];
  late IActivityIndicator _activityIndicator;

  @override
  Widget createAndroidWidget(BuildContext context) {
    int _selectedFactoryIndex = verifyPlatform();
    _activityIndicator =
        widgetsFactoryList[_selectedFactoryIndex].createActivityIndicator();
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      disabledColor: Color(0xFFDDDDDD),
      padding: padding ??
          const EdgeInsets.symmetric(
            vertical: 16.0,
          ),
      color: isSecondary
          ? Colors.transparent
          : color ?? Theme.of(context).buttonColor,
      elevation: isSecondary ? 0.0 : null,
      child: isLoading!
          ? Container(
              width: 18.0,
              height: 18.0,
              child: _activityIndicator.render(),
            )
          : child ??
              Text(
                text ?? '',
                style: GoogleFonts.montserrat(
                    color: textColor ?? Colors.white,
                    fontSize: fontSize ?? 16.0),
              ),
      onPressed: onPressed,
    );
  }

  @override
  Widget createIosWidget(BuildContext context) {
    return CupertinoButton(
      borderRadius: BorderRadius.circular(30.0),
      disabledColor: const Color(0xFFDDDDDD),
      color: isSecondary
          ? Colors.transparent
          : color ?? Theme.of(context).buttonColor,
      child: isLoading!
          ? SizedBox(
              width: 18.0,
              height: 18.0,
              child: _activityIndicator.render(),
            )
          : child == null
              ? Text(
                  text ?? '',
                  style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: fontSize ?? 17.0),
                )
              : child!,
      onPressed: onPressed,
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 17.0),
    );
  }
}
