import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/types_Widget/Movies_Details.dart';
import 'package:movies_app/model/movies.dart';

class MovieShape1 extends StatefulWidget {
  Movies k;
  MovieShape1(this.k);
  @override
  _MovieShape1State createState() => _MovieShape1State();
}

class _MovieShape1State extends State<MovieShape1> {
  void FavoriteIcon(){
    setState(() {
      if(this.widget.k.Active==true){
        this.widget.k.iconC= Colors.red;
      }
      else{
        this.widget.k.iconC= Colors.white54;
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MoviesDetails(this.widget.k)),
        );

      },
      child: Stack(
        children: [
          Image(
             // fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height /3,
              image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500${this.widget.k.poster_path!}")),
          Positioned(
            top: 0,
            right: MediaQuery.of(context).size.width / 30,
            child: IconButton(
              onPressed: () {
                setState(() {
                 this.widget.k.Active= !this.widget.k.Active!;
                });
                FavoriteIcon();
              },
              icon: Icon(
                Icons.favorite,
                color: this.widget.k.iconC,
              ),
              iconSize: 35,
            ),
          ),
        ],
      ),
    );
  }
}
