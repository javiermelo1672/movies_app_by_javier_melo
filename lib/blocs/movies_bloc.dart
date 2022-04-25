import 'package:leal_test_by_javier_melo/blocs/providers/bloc.dart';
import 'package:leal_test_by_javier_melo/domain/movies_data_use_case.dart';
import 'package:leal_test_by_javier_melo/models/popular_movies_response.dart';
import 'package:leal_test_by_javier_melo/models/recommendations_movies_response.dart';

class MoviesBloc extends Bloc {
  final MoviesDataUseCase _moviesDataUseCase;
  List<Result>? results;
  List<ResultRecommendations>? recommendations;
  MoviesBloc(this._moviesDataUseCase);

  Future<void> getMovies() {
    return _moviesDataUseCase.getPopularMovies().then((value) => {
          if (value.error == null &&
              value.data != null &&
              value.data!.results != null)
            {results = value.data!.results}
        });
  }

  Future<void> getRecommendationsMovies() {
    return _moviesDataUseCase.getRecommendationsMovies().then((value) => {
          if (value.error == null &&
              value.data != null &&
              value.data!.results != null)
            {recommendations = value.data!.results}
        });
  }

  @override
  void dispose() {}
}
