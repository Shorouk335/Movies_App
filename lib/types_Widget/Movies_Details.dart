import 'package:flutter/material.dart';
import 'package:movies_app/model/movies.dart';
class MoviesDetails extends StatefulWidget {
  Movies k;
  MoviesDetails(this.k);
  Color star1 =Colors.white54;
  Color star2 =Colors.white54;
  Color star3 =Colors.white54;
  @override
  _MoviesDetailsState createState() => _MoviesDetailsState();
}
class _MoviesDetailsState extends State<MoviesDetails> {
  void changrColor (){
  if (this.widget.k.vote_average>=6 &&this.widget.k.vote_average<=7)
    setState(() {
      this.widget.star1 =Colors.yellow;
    });
  else if (this.widget.k.vote_average>=7 &&this.widget.k.vote_average<=8)
    setState(() {
      this.widget.star1 =Colors.yellow;
      this.widget.star2 =Colors.yellow;

    });
  else if (this.widget.k.vote_average>=8 &&this.widget.k.vote_average<=9)
    setState(() {
      this.widget.star1 =Colors.yellow;
      this.widget.star2 =Colors.yellow;
      this.widget.star3 =Colors.yellow;
    });
  else
  {}
}
  @override
  Widget build(BuildContext context) {
    changrColor();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    fit: BoxFit.fitWidth,
                    height: MediaQuery.of(context).size.height/2,
                    image: NetworkImage("https://image.tmdb.org/t/p/w500${this.widget.k.poster_path!}"),),
                  Text("${this.widget.k.title!}",style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star,color: Colors.yellow,size: 50,),
                      Icon(Icons.star,color: Colors.yellow,size: 50,),
                      Icon(Icons.star,color: this.widget.star1,size: 50,),
                      Icon(Icons.star,color: this.widget.star2,size: 50,),
                      Icon(Icons.star,color: this.widget.star3,size: 50,),
                    ],
                  ),
                  Expanded(
                    child: Text("${this.widget.k.overview!}",
                      style: TextStyle(color: Colors.white54,fontSize:16,
                         ),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Language\n      ${this.widget.k.original_language!}",style: TextStyle(color: Colors.red),),
                      Text("Popularity\n   ${this.widget.k.popularity!.toString()}",style: TextStyle(color: Colors.red),),
                      Text("Release Date\n  ${this.widget.k.release_date!}",style: TextStyle(color: Colors.red),),
                    ],),
                ]
            ),
          ),
          if(this.widget.k.Active==true)
          Positioned(
            top: MediaQuery.of(context).size.height/120,
            right: MediaQuery.of(context).size.width /7,
            child: Icon(
                Icons.favorite,
                color: Colors.red,
                 size: 50,
              ),
            ),
        ],
      ),
    );
  }
}
