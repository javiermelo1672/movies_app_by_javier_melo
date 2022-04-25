import 'package:flutter/material.dart';
import 'package:leal_test_by_javier_melo/ui/no_unique_widgets_factory/widgets/iactivity_indicator.dart';

class AndroidActivityIndicator implements IActivityIndicator {
  @override
  Widget render() {
    return CircularProgressIndicator(
      backgroundColor: const Color(0xFFECECEC),
      valueColor: AlwaysStoppedAnimation<Color>(
        Colors.black.withOpacity(0.65),
      ),
    );
  }
}
