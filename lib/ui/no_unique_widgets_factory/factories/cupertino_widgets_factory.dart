import 'package:leal_test_by_javier_melo/ui/no_unique_widgets_factory/widgets/ios_loader/ios_activity_indicator.dart';
import '../iwidgets_factory.dart';
import '../widgets/iactivity_indicator.dart';

class CupertinoWidgetsFactory implements IWidgetsFactory {
  @override
  String getTitle() {
    return 'iOS widgets';
  }

  @override
  IActivityIndicator createActivityIndicator() {
    return IosActivityIndicator();
  }
}
