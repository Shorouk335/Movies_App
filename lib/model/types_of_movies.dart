
import 'package:movies_app/model/movies.dart';
import 'package:movies_app/types_Widget/MovieShape1.dart';
import 'package:movies_app/types_Widget/MovieShape2.dart';
import 'package:movies_app/types_Widget/MoviesList.dart';

class Types {
  //properity of all types of movies
  //عشان اجيب الداتا من ال json واحطها في اوبجكت من ال movies
static  List<Movies> TopRate =[];
static  List<Movies> NowPlaying =[];
static  List<Movies> Popular =[];
static  List<Movies> UpComing =[];
static  List<Movies> latest =[];
static  List<Movies> SimilarMovies =[];
//properity of shape of movies in app
  // عشان اعمل الشكل لكل نوع من الافلام تصميم خاص فبعمل listفيها اوبجكت من الاشكال وابعتلها الداتا
   static  List<MovieShape1> TopRatePage =[];
  static  List<MovieShape2> NowPlayingPage =[];
  static  List<MoviesList> PopularPage =[];
  static  List<MoviesList> UpComingPage =[];
  static  List<MoviesList> SimilarMoviesPage =[];


}