import 'package:leal_test_by_javier_melo/ui/no_unique_widgets_factory/widgets/android_loader/android_activity_indicator.dart';
import '../iwidgets_factory.dart';
import '../widgets/iactivity_indicator.dart';

class MaterialWidgetsFactory implements IWidgetsFactory {
  @override
  String getTitle() {
    return 'Android widgets';
  }

  @override
  IActivityIndicator createActivityIndicator() {
    return AndroidActivityIndicator();
  }
}
