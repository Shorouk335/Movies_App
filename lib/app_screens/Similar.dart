
import 'package:flutter/material.dart';
import 'package:movies_app/model/types_of_movies.dart';

class SimilarMovies extends StatefulWidget {
  @override
  _SimilarMoviesState createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Similar Movies",style: TextStyle(
          color: Colors.red,
          fontSize: 25,
        ),),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount:9,
          itemBuilder: (context,index){
            return Row(
              children: [
                Expanded(child: Types.SimilarMoviesPage[index]),
                Expanded(child: Types.SimilarMoviesPage[index+10]),
              ],
            ); }),

    );
  }
}
