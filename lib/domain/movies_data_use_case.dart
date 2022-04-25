import 'package:leal_test_by_javier_melo/models/detailed_movie_model.dart';
import 'package:leal_test_by_javier_melo/models/popular_movies_response.dart';
import 'package:leal_test_by_javier_melo/models/recommendations_movies_response.dart';
import 'package:leal_test_by_javier_melo/models/result_response_model.dart';

abstract class MoviesDataRepository {
  Future<ResultResponse<PopularMoviesResponse>> getPopularMovies();
  Future<ResultResponse<RecommendationsMoviesResponse>>
      getRecommendationsMovies();
  Future<ResultResponse<DetailledMovieResponse>> getDetailedMovie(String id);
}

abstract class MoviesDataUseCase {
  Future<ResultResponse<PopularMoviesResponse>> getPopularMovies();
  Future<ResultResponse<RecommendationsMoviesResponse>>
      getRecommendationsMovies();
  Future<ResultResponse<DetailledMovieResponse>> getDetailedMovie(String id);
}

class MoviesDataUseCaseImpl implements MoviesDataUseCase {
  final MoviesDataRepository? _repository;

  MoviesDataUseCaseImpl(this._repository);

  @override
  Future<ResultResponse<PopularMoviesResponse>> getPopularMovies() {
    return _repository!.getPopularMovies();
  }

  @override
  Future<ResultResponse<RecommendationsMoviesResponse>>
      getRecommendationsMovies() {
    return _repository!.getRecommendationsMovies();
  }

  @override
  Future<ResultResponse<DetailledMovieResponse>> getDetailedMovie(String id) {
    return _repository!.getDetailedMovie(id);
  }
}
