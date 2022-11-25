import 'package:api_app/src/ui/form_screen.dart';
import 'package:flutter/material.dart';

import '../api/api_service.dart';
import '../model/profile.dart';

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
        builder: (BuildContext context, AsyncSnapshot<List<Profile>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Profile>? profiles = snapshot.data;
            return _buildListView(profiles!);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildListView(List<Profile> profiles) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          Profile profile = profiles[index];
          return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(profile.email),
                      Text(profile.age.toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Warning"),
                                      content: Text(
                                          "Are you want to delete data profile ${profile.name}?"),
                                      actions: [
                                        ElevatedButton(
                                          child: Text("Yes"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            apiService
                                                .deleteProfile(profile.id)
                                                .then((isSuccess) {
                                              if (isSuccess) {
                                                setState(() {});
                                                ScaffoldMessenger.of(
                                                        this.context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Delete data success")));
                                              } else {
                                                ScaffoldMessenger.of(
                                                        this.context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Delete data failed")));
                                              }
                                            });
                                          },
                                        ),
                                        ElevatedButton(
                                          child: Text("No"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Text(
                              "Delete",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              var result = await Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return FormScreen(profile: profile);
                              }));
                              if (result != null) {
                                setState(() {});
                              }
                            },
                            child: Text(
                              "Edit",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        },
        itemCount: profiles.length,
      ),
    );
  }
}
