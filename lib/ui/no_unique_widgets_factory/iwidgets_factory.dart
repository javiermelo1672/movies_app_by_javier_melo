import 'widgets/iactivity_indicator.dart';

abstract class IWidgetsFactory {
  String getTitle();
  IActivityIndicator createActivityIndicator();
}
