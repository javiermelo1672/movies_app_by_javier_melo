import 'package:leal_test_by_javier_melo/app/settings/application.dart';
import 'package:leal_test_by_javier_melo/data/movies_data_respository.dart';
import 'package:leal_test_by_javier_melo/data/security_repository.dart';
import 'package:leal_test_by_javier_melo/data_source/movies_api_source.dart';
import 'package:leal_test_by_javier_melo/data_source/security_api_source.dart';
import 'package:leal_test_by_javier_melo/utils/connectivity/my_connectivity.dart';
import 'package:leal_test_by_javier_melo/utils/connectivity/my_connectivity_impl.dart';

class DataSourceInjector {
  static DataSourceInjector? _singleton;
  MyConnectivity? _myConnectivity;

  factory DataSourceInjector() {
    _singleton ??= DataSourceInjector._();
    return _singleton!;
  }

  DataSourceInjector._() {
    _myConnectivity = MyConnectivityImpl();
  }

  SecurityApiSource provideSecurityApiSource() {
    return SecurityApiSourceImpl(
      Application().appSettings?.securityUrl,
      _myConnectivity,
    );
  }

  MoviesDataApiSource provideMoviesDataApiSourc() {
    return MoviesDataApiSourceImpl(
      Application().appSettings?.securityUrl,
      _myConnectivity,
    );
  }
}
