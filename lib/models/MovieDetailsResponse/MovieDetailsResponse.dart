import 'Genre.dart';
import 'ProductionCompany.dart';
import 'ProductionCountry.dart';
import 'SpokenLanguage.dart';

/// status_code : 7
/// status_message : "Invalid API key: You must be granted a valid key."
/// success : false
/// adult : false
/// backdrop_path : "/7h6TqPB3ESmjuVbxCxAeB1c9OB1.jpg"
/// belongs_to_collection : null
/// budget : 17500000
/// genres : [{"id":18,"name":"Drama"},{"id":27,"name":"Horror"},{"id":878,"name":"Science Fiction"}]
/// homepage : "https://www.the-match-factory.com/catalogue/films/the-substance.html"
/// id : 933260
/// imdb_id : "tt17526714"
/// origin_country : ["GB"]
/// original_language : "en"
/// original_title : "The Substance"
/// overview : "A fading celebrity decides to use a black market drug, a cell-replicating substance that temporarily creates a younger, better version of herself."
/// popularity : 1062.924
/// poster_path : "/lqoMzCcZYEFK729d6qzt349fB4o.jpg"
/// production_companies : [{"id":10163,"logo_path":"/16KWBMmfPX0aJzDExDrPxSLj0Pg.png","name":"Working Title Films","origin_country":"GB"},{"id":233939,"logo_path":null,"name":"Blacksmith","origin_country":"FR"}]
/// production_countries : [{"iso_3166_1":"FR","name":"France"},{"iso_3166_1":"GB","name":"United Kingdom"}]
/// release_date : "2024-09-07"
/// revenue : 3225810
/// runtime : 141
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"}]
/// status : "Released"
/// tagline : "If you follow the instructions, what could go wrong?"
/// title : "The Substance"
/// video : false
/// vote_average : 7.182
/// vote_count : 154

class MovieDetailsResponse
{
  num? statusCode;
  String? statusMessage;
  bool? success;
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  num? budget;
  List<Genre>? genres;
  String? homepage;
  num? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  List<ProductionCompany>? productionCompanies;
  List<ProductionCountry>? productionCountries;
  String? releaseDate;
  num? revenue;
  num? runtime;
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;

  MovieDetailsResponse({
      this.statusCode, 
      this.statusMessage, 
      this.success, 
      this.adult, 
      this.backdropPath, 
      this.belongsToCollection, 
      this.budget, 
      this.genres, 
      this.homepage, 
      this.id, 
      this.imdbId, 
      this.originCountry, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.productionCompanies, 
      this.productionCountries, 
      this.releaseDate, 
      this.revenue, 
      this.runtime, 
      this.spokenLanguages, 
      this.status, 
      this.tagline, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount
  });

  MovieDetailsResponse.fromJson(dynamic json)
  {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    success = json['success'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null)
    {
      genres = [];
      json['genres'].forEach((v)
      {
        genres?.add(Genre.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originCountry = json['origin_country'] != null ? json['origin_country'].cast<String>() : [];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null)
    {
      productionCompanies = [];
      json['production_companies'].forEach((v)
      {
        productionCompanies?.add(ProductionCompany.fromJson(v));
      });
    }
    if (json['production_countries'] != null)
    {
      productionCountries = [];
      json['production_countries'].forEach((v)
      {
        productionCountries?.add(ProductionCountry.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null)
    {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v)
      {
        spokenLanguages?.add(SpokenLanguage.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson()
  {
    final map = <String, dynamic>{};
    map['status_code'] = statusCode;
    map['status_message'] = statusMessage;
    map['success'] = success;
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['belongs_to_collection'] = belongsToCollection;
    map['budget'] = budget;
    if (genres != null)
    {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['origin_country'] = originCountry;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    if (productionCompanies != null)
    {
      map['production_companies'] = productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null)
    {
      map['production_countries'] = productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    if (spokenLanguages != null)
    {
      map['spoken_languages'] = spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}