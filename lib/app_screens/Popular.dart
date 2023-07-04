
import 'package:flutter/material.dart';
import 'package:movies_app/model/types_of_movies.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Popular Movies",style: TextStyle(
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
                          Expanded(child: Types.PopularPage[index]),
                          Expanded(child: Types.PopularPage[index+10]),
                        ],
                      ); }),

    );
  }
}
