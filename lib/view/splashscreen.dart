import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nozaapp/view/chatbot_screen.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
   Timer(Duration(seconds: 2), (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChatbotScreen()));
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                   Color(0xFFDB8DD0),
                   Color.fromARGB(255, 255, 132, 197),
                   Color(0xFFDB8DD0),
                ]
                ),
         ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor:  Color(0xFF6A1E55),
                radius: 70,
                child: Center(child: Image.asset("assets/image.png",height: 200,))),
            ),
            Container(
              child: Row
              (
                crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        
              children: [
                // Text("N",style:TextStyle(fontSize: 55,color:Color(0xFF6251C3),fontWeight: FontWeight.bold ),),
                Column(
                  children: [
                    SizedBox(height: 20,),    
                    Text("Noza",style:TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: 
                       Color(0xFF6A1E55),fontFamily: "font"
                    ),),
                    Text("Your Friend",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:
                      Color(0xFF6A1E55),fontFamily: "font"
                    ),),
                  ],
                )
              ],
              ),
            )
          ],
        ),
      ),


    );
  }
}