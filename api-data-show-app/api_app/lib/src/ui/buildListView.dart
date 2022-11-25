import 'package:api_app/src/ui/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../api/api_service.dart';
import '../model/profile.dart';

class buildListView extends StatefulWidget {
  buildListView(this.profiles, {super.key});
  late List<Profile> profiles;

  @override
  State<buildListView> createState() => _buildListViewState(profiles);
}

class _buildListViewState extends State<buildListView> {
  late ApiService apiService;
  late List<Profile> profiles;

  _buildListViewState(List<Profile> profiles);

  @override
  void initState() {
    super.initState();
    profiles = widget.profiles;
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
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
                                                setState(() {
                                                  profiles = profiles;
                                                });
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
