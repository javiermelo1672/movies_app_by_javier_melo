import 'package:leal_test_by_javier_melo/app/settings/application.dart';
import 'package:leal_test_by_javier_melo/data/movies_data_respository.dart';
import 'package:leal_test_by_javier_melo/data_source/api_base_source.dart';
import 'package:leal_test_by_javier_melo/models/recommendations_movies_response.dart';
import 'package:leal_test_by_javier_melo/models/result_response_model.dart';
import 'package:leal_test_by_javier_melo/utils/connectivity/my_connectivity.dart';
import 'package:http/http.dart' as http;
import '../models/popular_movies_response.dart';
import 'package:leal_test_by_javier_melo/models/popular_movies_response.dart';

class MoviesDataApiSourceImpl extends ApiBaseSource
    implements MoviesDataApiSource {
  MoviesDataApiSourceImpl(
    String? baseUrl,
    MyConnectivity? connectivity, {
    http.Client? client,
  }) : super(
          baseUrl,
          client ?? http.Client(),
          connectivity,
        );
  @override
  Future<ResultResponse<PopularMoviesResponse>> getPopularMovies() {
    var url =
        '$baseUrl/movie/popular?api_key=${Application().appSettings?.token}';

    return get<PopularMoviesResponse>(url, (value) {
      return PopularMoviesResponse.fromJson(value);
    });
  }

  @override
  Future<ResultResponse<RecommendationsMoviesResponse>>
      getRecommendationsMovies() {
    var url =
        '$baseUrl/movie/top_rated?api_key=${Application().appSettings?.token}';

    return get<RecommendationsMoviesResponse>(url, (value) {
      return RecommendationsMoviesResponse.fromJson(value);
    });
  }
}
