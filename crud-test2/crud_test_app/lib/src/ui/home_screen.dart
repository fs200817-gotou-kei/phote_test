import 'package:crud_test_app/src/api/api_service.dart';
import 'package:crud_test_app/src/model/profile.dart';
import 'package:crud_test_app/src/ui/build_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder<List<Profile>>(
      future: apiService.getProfiles(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
                "Something wrong with message: ${snapshot.error.toString()}"),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          List<Profile>? profiles = snapshot.data;
          return BuildListView(profiles!);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
