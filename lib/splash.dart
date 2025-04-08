
import 'package:clozafinal/webviewpage.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Webviewpage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          
          Image.asset('images/ClozaLogo.png', height: 120, width: 120,),
          Text('Welcome', style: TextStyle(fontSize: 30, color: Colors.white, fontFamily: 'Nunito', letterSpacing: 5),),
        ] )
      ),
    );
  }
}