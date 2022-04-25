import 'package:leal_test_by_javier_melo/data/movies_data_respository.dart';
import 'package:leal_test_by_javier_melo/data/security_repository.dart';
import 'package:leal_test_by_javier_melo/data_injector/data_source_injector.dart';
import 'package:leal_test_by_javier_melo/domain/movies_data_use_case.dart';

import 'package:leal_test_by_javier_melo/domain/security_use_case.dart';

class RepositoryInjector {
  static RepositoryInjector? _singleton;

  factory RepositoryInjector() {
    _singleton ??= RepositoryInjector._();
    return _singleton!;
  }

  RepositoryInjector._();
  SecurityRepository provideSecurityRepository() {
    return SecurityRepositoryImpl(
      DataSourceInjector().provideSecurityApiSource(),
    );
  }

  MoviesDataRepository provideMoviesDataRepository() {
    return MoviesDataRepositoryImpl(
      DataSourceInjector().provideMoviesDataApiSourc(),
    );
  }
}
