import 'dart:async';
import 'package:dynamicapp/homescreen.dart';
import 'package:dynamicapp/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), ()async{
      SharedPreferences prefs=await SharedPreferences.getInstance();
      bool? checklogin=prefs.getBool("login");
      if(checklogin!=null){
        if(checklogin==true){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        }
        else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

        }
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.person,
          size: 80,
          color: Colors.blue,
        ),
      ),
    );
  }
}
