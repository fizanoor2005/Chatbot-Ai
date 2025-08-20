import 'package:flutter/material.dart';
import 'package:nozaapp/controller/provider/chatbot_provider.dart';
import 'package:nozaapp/view/chatbot_screen.dart';
// import 'package:nozaapp/view/practice.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ChatbotProvider())
      ],
      child: MaterialApp(
        home:ChatbotScreen() ,
        // home:MyPage() ,

        debugShowCheckedModeBanner: false,
      ),
    );
  }
}