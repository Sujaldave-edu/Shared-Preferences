import 'dart:developer';

import 'package:dynamicapp/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(
            width: 300,
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter Email",
                suffixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)
                )
              ),
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            width: 300,
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Enter Password",
                  suffixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                  )
              ),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            login(emailController.text.toString(), passwordController.text.toString());
          }, child: Text("Log In"))
        ],),
      ),
    );
  }

  login(String email,String password)async{
    if(email=="" || password==""){
      log("Enter Required Field's");
    }
    else{
      SharedPreferences prefs=await SharedPreferences.getInstance();
      prefs.setBool("login", true);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

    }
  }
}
