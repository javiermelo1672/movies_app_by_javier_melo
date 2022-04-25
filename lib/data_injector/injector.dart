import 'package:leal_test_by_javier_melo/data_injector/repository_injector.dart';
import 'package:leal_test_by_javier_melo/domain/movies_data_use_case.dart';
import 'package:leal_test_by_javier_melo/domain/security_use_case.dart';

class Injector {
  static Injector? _singleton;

  factory Injector() {
    _singleton ??= Injector._();
    return _singleton!;
  }

  Injector._();

  SecurityUseCase provideSecurityUseCase() {
    return SecurityUseCaseImpl(
      RepositoryInjector().provideSecurityRepository(),
    );
  }

  MoviesDataUseCase provideMoviesDataUseCase() {
    return MoviesDataUseCaseImpl(
      RepositoryInjector().provideMoviesDataRepository(),
    );
  }
}
