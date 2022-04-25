import 'package:leal_test_by_javier_melo/blocs/providers/bloc.dart';
import 'package:leal_test_by_javier_melo/domain/movies_data_use_case.dart';
import 'package:leal_test_by_javier_melo/models/recommendations_movies_response.dart';

class FavouritesBloc extends Bloc {
  final MoviesDataUseCase _moviesDataUseCase;
  List<ResultRecommendations>? recommendations;
  FavouritesBloc(this._moviesDataUseCase);

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
