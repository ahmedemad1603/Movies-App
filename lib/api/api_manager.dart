import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/PopularMovies/PopularMovies.dart';
import '../models/TopRated/TopRatedResponse.dart';

class ApiManager
{
  static const String apiKey = '15d3b18ccad1c0de083027aef48c8402';
  static const String baseUrl = 'api.themoviedb.org/3/';

  static Future<PopularMovies> getPopular() async
  {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=15d3b18ccad1c0de083027aef48c8402'));

    var popularResponse = PopularMovies.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return popularResponse;
    }

    throw Exception('error loading movies ');
  }

  static Future<TopRatedResponse> getTopRated() async
  {
    // var params = {'apiKey': apiKey};
    // print("url1" + baseUrl + popularMovies);
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=15d3b18ccad1c0de083027aef48c8402'));

    var topRatedResponse = TopRatedResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return topRatedResponse;
    }

    throw Exception('error loading movies ');
  }

}