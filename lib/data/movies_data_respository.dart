import 'package:leal_test_by_javier_melo/domain/movies_data_use_case.dart';
import 'package:leal_test_by_javier_melo/models/detailed_movie_model.dart';
import 'package:leal_test_by_javier_melo/models/popular_movies_response.dart';
import 'package:leal_test_by_javier_melo/models/recommendations_movies_response.dart';
import 'package:leal_test_by_javier_melo/models/result_response_model.dart';

abstract class MoviesDataApiSource {
  Future<ResultResponse<PopularMoviesResponse>> getPopularMovies();
  Future<ResultResponse<RecommendationsMoviesResponse>>
      getRecommendationsMovies();
  Future<ResultResponse<DetailledMovieResponse>> getDetailedMovie(String id);
}

class MoviesDataRepositoryImpl implements MoviesDataRepository {
  final MoviesDataApiSource? _apiSource;

  MoviesDataRepositoryImpl(this._apiSource);
  @override
  Future<ResultResponse<PopularMoviesResponse>> getPopularMovies() {
    return _apiSource!.getPopularMovies();
  }

  @override
  Future<ResultResponse<RecommendationsMoviesResponse>>
      getRecommendationsMovies() {
    return _apiSource!.getRecommendationsMovies();
  }

  @override
  Future<ResultResponse<DetailledMovieResponse>> getDetailedMovie(String id) {
    return _apiSource!.getDetailedMovie(id);
  }
}
