import 'package:flutter/cupertino.dart';
import 'package:leal_test_by_javier_melo/ui/no_unique_widgets_factory/abstract_factory.dart';

class IosActivityIndicator implements IActivityIndicator {
  @override
  Widget render() {
    return const CupertinoActivityIndicator();
  }
}
