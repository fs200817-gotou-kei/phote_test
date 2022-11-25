import 'package:flutter/material.dart';
import 'package:my_app/components/estimate_create.dart';
import 'package:my_app/services/estimate_service.dart';
import 'components/estimate_search.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        routes: {
          '/': (context) => EstimateSearch(),
          '/create': (context) => EstimateCreate()
        });
  }
}
