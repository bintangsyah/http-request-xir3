import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_request_xir3/models/movie.dart';


class HttpService {
  final String apiKey = 'isi dengan key anda';
  final String baseUrl = 'https://movie.tukanginyuk.com/api/getmovie?key=';

  Future<List?> getPopularMovies() async {
    final String uri = '$baseUrl?apiKey=$apiKey'; // Construct the URL correctly

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("success");
      final jsonResponse =json.decode(result.body);
      final moviesMap = jsonResponse['data'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("fail");
      return null;
    }
  }
}