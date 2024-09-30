/// adult : false
/// backdrop_path : "/9H64mSSezN1T9CQKgbgV06BCZM4.jpg"
/// genre_ids : [18,9648,53]
/// id : 9652
/// original_language : "it"
/// original_title : "Professione: reporter"
/// overview : "David Locke is a world-weary American journalist who has been sent to cover a conflict in northern Africa, but he makes little progress with the story. When he discovers the body of a stranger who looks similar to him, Locke assumes the dead man's identity. However, he soon finds out that the man was an arms dealer, leading Locke into dangerous situations. Aided by a beautiful woman, Locke attempts to avoid both the police and criminals out to get him."
/// popularity : 9.709
/// poster_path : "/rYfnOaYYgAuoI8R0JiAV72jAESS.jpg"
/// release_date : "1975-02-28"
/// title : "The Passenger"
/// video : false
/// vote_average : 7.259
/// vote_count : 478

class SimilarMovie
{
  bool? adult;
  String? backdropPath;
  List<num>? genreIds;
  num? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;

  SimilarMovie({
      this.adult, 
      this.backdropPath, 
      this.genreIds, 
      this.id, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  SimilarMovie.fromJson(dynamic json)
  {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson()
  {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}