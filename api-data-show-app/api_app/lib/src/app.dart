import 'package:api_app/src/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyApp extends StatelessWidget {
  // デバッグを行うかどうか
  static const bool isDebug = false;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Api Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: isDebug,
      home: const HomeScreen(),
    );
  }
}
