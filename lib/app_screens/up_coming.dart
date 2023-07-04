
import 'package:flutter/material.dart';
import 'package:movies_app/model/types_of_movies.dart';

class UpComing extends StatefulWidget {
  @override
  _UpComingPageState createState() => _UpComingPageState();
}

class _UpComingPageState extends State<UpComing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("UpComing Movies",style: TextStyle(
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
                Expanded(child: Types.UpComingPage[index]),
                Expanded(child: Types.UpComingPage[index+10]),
              ],
            ); }),

    );
  }
}
