import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leal_test_by_javier_melo/app/settings/app_colors.dart';
import 'package:leal_test_by_javier_melo/ui/platform_widget.dart';

class PlatformTextField extends PlatformWidget<Column, TextField> {
  final FocusNode? focusNode;
  final bool obscureText;
  final String? labelText;
  final String? hintText;
  final Widget? suffix;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? errorText;
  final bool autocorrect;
  final List<TextInputFormatter>? inputFormatters;
  final Color? borderColor;
  final int maxLines;
  final int? minLines;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final TextAlign textAlign;
  final OverlayVisibilityMode iOSClearButtonMode;
  final bool enabled;
  final bool filled;
  final Widget? prefix;
  final InputBorder? focusedBorder;
  final double radius;

  PlatformTextField({
    this.focusNode,
    this.obscureText = false,
    this.labelText,
    this.hintText,
    this.suffix,
    this.style,
    this.textInputAction,
    this.onSubmitted,
    this.keyboardType,
    this.controller,
    this.errorText,
    this.autocorrect = true,
    this.inputFormatters,
    this.borderColor,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.iOSClearButtonMode = OverlayVisibilityMode.editing,
    this.enabled = true,
    this.filled = false,
    this.prefix,
    this.focusedBorder,
    this.radius = 4.0,
  });

  @override
  TextField createAndroidWidget(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      maxLines: maxLines,
      minLines: minLines,
      inputFormatters: inputFormatters,
      autocorrect: autocorrect,
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      style: style,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      onSubmitted: onSubmitted,
      maxLength: maxLength,
      textAlign: textAlign,
      decoration: InputDecoration(
          filled: filled,
          fillColor: filled
              ? enabled
                  ? Colors.white
                  : const Color(0xFFEFEFEF)
              : Colors.white,
          contentPadding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          labelText: labelText,
          hintText: hintText,
          labelStyle: style,
          errorText: errorText,
          errorMaxLines: 3,
          alignLabelWithHint: maxLines > 1,
          suffixIcon: suffix,
          prefixIcon: prefix,
          enabled: enabled,
          focusedBorder: focusedBorder,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: whiteColor),
          )),
    );
  }

  @override
  Column createIosWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        labelText != null ? _Title(labelText, style) : Container(),
        CupertinoTextField(
          padding: const EdgeInsets.all(10.0),
          onChanged: onChanged,
          maxLines: maxLines,
          minLines: minLines,
          autocorrect: autocorrect,
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText,
          placeholder: hintText,
          suffix: suffix,
          prefix: prefix,
          style: style,
          textInputAction: textInputAction,
          onSubmitted: onSubmitted,
          keyboardType: keyboardType,
          clearButtonMode: iOSClearButtonMode,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          enabled: enabled,
          textAlign: textAlign,
          decoration: BoxDecoration(
            color: filled
                ? enabled
                    ? Colors.white
                    : const Color(0xFFEFEFEF)
                : Colors.white,
          ),
        ),
        //ErrorText(errorText),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String? labelText;
  final TextStyle? style;

  _Title(this.labelText, this.style);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
          width: double.infinity,
          child: Text(
            labelText!,
            style: style,
          )),
    );
  }
}
