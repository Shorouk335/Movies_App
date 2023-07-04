import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/app_screens/Popular.dart';
import 'package:movies_app/app_screens/Similar.dart';
import 'package:movies_app/app_screens/up_coming.dart';
import 'package:movies_app/model/movies.dart';
import 'package:movies_app/model/types_of_movies.dart';
import 'package:movies_app/types_Widget/MovieShape1.dart';
import 'package:movies_app/types_Widget/MovieShape2.dart';
import 'package:movies_app/types_Widget/MoviesList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoad = true;
  @override
  void initState() {
    getData("top_rated", Types.TopRate, Types.TopRatePage, 1);
    getData("now_playing", Types.NowPlaying, Types.NowPlayingPage, 2);
    getData("popular", Types.Popular, Types.PopularPage, 3);
    getData("550/similar", Types.SimilarMovies, Types.SimilarMoviesPage, 3);
    getData("upcoming", Types.UpComing, Types.UpComingPage, 3);
    super.initState();
  }

  getData(var url, List type, List shape, var b) async {
    var response = await http.get(
      Uri.parse(
          "https://api.themoviedb.org/3/movie/${url}?api_key=b6ed23dfdf510291f459cb2c46a090ef"),
    );
    var jsonDecoded = jsonDecode(response.body);
    for (Map<String, dynamic> data in jsonDecoded['results']) {
      type.add(Movies.fromMap(data));
    }

    if (type.isNotEmpty)
      for (Movies data in type) {
        if (b == 1)
          shape.add(MovieShape1(data));
        else if (b == 2)
          shape.add(MovieShape2(data));
        else if (b==3)
          shape.add(MoviesList(data));
      }
    else
      print("errrrrrrror in get data");
    setState(() {
      _isLoad = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Movies App",
          style: TextStyle(color: Colors.red, fontSize: 25),
        ),
        actions: [
          PopupMenuButton(
              icon: Icon(
                Icons.reorder,
                color: Colors.red,
                size: 30,
              ),
              color: Colors.black,
              onSelected: (x) {
                if (x == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Popular()),
                  );
                }
                if (x == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SimilarMovies()),
                  );
                }
                if (x == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpComing()),
                  );
                }
              },
              itemBuilder: (y) {
                return [
                  PopupMenuItem(
                    child: Text(
                      'Popular',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Similar',
                      style: TextStyle(color: Colors.red),
                    ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Up Coming',
                      style: TextStyle(color: Colors.red),
                    ),
                    value: 2,
                  ),
                ];
              }),
          SizedBox(
            width: 5,
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: _isLoad
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Text(
                "  Top Rate Movies",
                style: TextStyle(color: Colors.white60, fontSize: 28,fontWeight: FontWeight.bold),
              )),
          Expanded(
            flex: 7,
            child:ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(child: Types.TopRatePage[0] ,width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[1],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[2],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[3],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[4],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[5],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[6],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[7],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[8],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[9],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[10],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[11],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[12],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[13],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[14],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[15],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[16],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[17],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[18],width: MediaQuery.of(context).size.width/2,),
                Container(child: Types.TopRatePage[19],width: MediaQuery.of(context).size.width/2,),
              ],
            ),),
          Expanded(
              flex: 1,
              child: Text(
                "  Now Playing Movies",
                style: TextStyle(color: Colors.white60, fontSize: 28,fontWeight: FontWeight.bold),
              )),
          Expanded(
            flex: 6,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Types.NowPlayingPage[index];
                }),
          ),
        ],
      ),
    
    );
  }
}
