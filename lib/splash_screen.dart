import 'package:flutter/material.dart';
import 'package:movies_app/app_screens/home_page%20.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context){
            return HomePage();
          }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Center(
          child: Image.asset("images/iconmovies.png",
            height: MediaQuery.of(context).size.height/2.8,),
        ),


    );
  }
}


