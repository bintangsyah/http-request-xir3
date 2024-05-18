import 'package:flutter/material.dart';
import 'package:http_request_xir3/pages/movie_detail.dart';
import 'package:http_request_xir3/service/http_service.dart';


class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int? moviesCount = 0;
  List? movies;
  HttpService? service;

  Future initialize() async {
    movies = [];
    movies = await service!.getPopularMovies();
    setState(() {
      moviesCount = movies!.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {  
    service!.getPopularMovies().then((value) => {
          setState(() {
            // result = value.toString();
          })
        });

    return Scaffold(
        appBar: AppBar(
          title: Text("Popular Movies"),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
            itemCount: moviesCount,
            itemBuilder: (context, int position) {
              return Card(
                color: Color.fromARGB(255, 155, 152, 152),
                elevation: 2.0,
                child: ListTile(
                  leading: Image(
                    image: NetworkImage(movies![position].posterPath),
                  ),
                  title: Text(movies![position].title),
                  subtitle: Text(
                      'Rating: = ' + movies![position].voteAverage.toString()),
                      onTap: (){
                         Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MovieDetail(movies![position]),
                  ),
                );
                      },
                ),
              );
            }));
  }
}