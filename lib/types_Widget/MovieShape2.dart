
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/types_Widget/Movies_Details.dart';
import 'package:movies_app/model/movies.dart';

class MovieShape2 extends StatefulWidget {
  Movies k ;
  MovieShape2(this.k);
  Color star1 =Colors.white54;
  Color star2 =Colors.white54;
  Color star3 =Colors.white54;
  @override
  _MovieShape2State createState() => _MovieShape2State();
}

class _MovieShape2State extends State<MovieShape2> {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MoviesDetails(this.widget.k)),
          );
        },
        child: ListTile(
          leading: Image(
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width/8,
              height: MediaQuery.of(context).size.height/8,
              image: NetworkImage("https://image.tmdb.org/t/p/w500${this.widget.k.poster_path!}")),
             title: Text(
               "\n${this.widget.k.title!}",style: TextStyle(color: Colors.white,fontSize: 20),
             ) ,
          subtitle: Row(
            children: [
              Icon(Icons.star,color: Colors.yellow,),
              Icon(Icons.star,color: Colors.yellow,),
              Icon(Icons.star,color: this.widget.star1,),
              Icon(Icons.star,color: this.widget.star2,),
              Icon(Icons.star,color: this.widget.star3,),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.favorite,color: this.widget.k.iconC,),
            onPressed: (){
              setState(() {
                this.widget.k.Active=!this.widget.k.Active!;
              });
             FavoriteIcon();
            },
            iconSize: 30,
          ),


        ),
      ),
    );

  }
}
