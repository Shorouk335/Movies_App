import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Movies {
  dynamic vote_average ;//التقيم
  dynamic popularity ;//عدد المشاهدات
  String? title = ""; //الاسم
  String? overview = "";//الوصف
  String? poster_path ="";//الصورة
  String? release_date = "";//التاريخ
  String? original_language ="";//اللغه
  bool? Active =false;//مفضل او لا
  Color iconC =Colors.white54;
  Movies(
      {required this.vote_average,
      required this.title,
      required this.overview,
      required this.poster_path,
      required this.release_date,
        required this.original_language,
       required this.popularity,
        required this.Active,
        required this.iconC
      });

  factory Movies.fromMap(Map<String, dynamic> data) {
    return Movies(
      vote_average: data['vote_average'] ?? 0.0,
        title: data['title'] ?? "",
      overview: data['overview'] ?? "",
      poster_path: data['poster_path'] ?? "",
      release_date: data['release_date'] ?? "",
      original_language: data['original_language'] ?? "",
      popularity: data['popularity'] ?? 0.0,
      Active: false,
      iconC: Colors.white54,
    );
  }



}
