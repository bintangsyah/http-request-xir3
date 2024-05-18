
class Movie {
  late int id;
  late String title;
  late num voteAverage; // Use 'num' type to allow both int and double
  late String overview;
  late String posterPath;

  Movie(this.id, this.title, this.voteAverage, this.overview, this.posterPath);

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    voteAverage = json['voteaverage'] * 1.0; // Ensure to handle null case and use 'num' type
    overview = json['overview'];
    posterPath = json['posterpath'] ?? '';
  }
}
