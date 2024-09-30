import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/MovieDetailsResponse/MovieDetailsResponse.dart';
import 'package:movies_app/models/NewReleasesResponse/NewReleasesResponse.dart';
import 'package:movies_app/models/PopularResponse/PopularResponse.dart';
import 'package:movies_app/models/SimilarResponse/SimilarResponse.dart';
import '../models/TopRatedResponse/TopRatedResponse.dart';

class ApiManager
{
  static const String apiKey = '15d3b18ccad1c0de083027aef48c8402';
  static const String baseUrl = 'api.themoviedb.org/3';

  static Future<PopularResponse> getPopular() async
  {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=15d3b18ccad1c0de083027aef48c8402'));

    var newPopularResponse = PopularResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200)
    {
      return newPopularResponse;
    }

    throw Exception('error loading movies ');
  }

  static Future<NewReleasesResponse> getNewReleases() async
  {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=15d3b18ccad1c0de083027aef48c8402'));

    var newReleasesResponse = NewReleasesResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200)
    {
      return newReleasesResponse;
    }

    throw Exception('error loading movies ');
  }

  static Future<TopRatedResponse> getTopRated() async
  {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=15d3b18ccad1c0de083027aef48c8402'));

    var topRatedResponse = TopRatedResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200)
    {
      return topRatedResponse;
    }

    throw Exception('error loading movies ');
  }

  static Future<MovieDetailsResponse> getMovieDetails(num movieId) async
  {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/${movieId.toString()}?api_key=15d3b18ccad1c0de083027aef48c8402'));

    var movieDetailsResponse = MovieDetailsResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200)
    {
      return movieDetailsResponse;
    }

    throw Exception('error loading movies ');
  }

  static Future<SimilarResponse> getSimilar(num movieId) async
  {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/${movieId.toString()}/similar?api_key=15d3b18ccad1c0de083027aef48c8402'));

    var similarResponse = SimilarResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200)
    {
      return similarResponse;
    }

    throw Exception('error loading movies ');
  }

}