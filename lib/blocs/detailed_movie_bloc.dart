import 'package:leal_test_by_javier_melo/blocs/providers/bloc.dart';
import 'package:leal_test_by_javier_melo/domain/movies_data_use_case.dart';

import '../models/detailed_movie_model.dart';

class DetailedMoviebloc extends Bloc {
  final MoviesDataUseCase _moviesDataUseCase;
  DetailledMovieResponse? movie;

  DetailedMoviebloc(this._moviesDataUseCase);
  Future<void> getDetailedMovie(String id) {
    return _moviesDataUseCase.getDetailedMovie(id).then((value) => {
          if (value.error == null && value.data != null) {movie = value.data!}
        });
  }

  @override
  void dispose() {}
}
