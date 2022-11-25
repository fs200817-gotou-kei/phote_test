import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_app/api/api_service.dart';
import 'package:test_app/model/work_site.dart';
import 'package:test_app/ui/content_screen.dart';

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
    return Container(
      child: FutureBuilder<List<WorkSite>>(
          future: apiService.getAllWorkSites(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<WorkSite>? worksites = snapshot.data;
              return _buildListView(worksites!);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget _buildListView(List<WorkSite> worksites) {
    return Container(
      child: ListView.builder(
        itemCount: worksites.length,
        itemBuilder: (context, index) {
          dynamic worksite = worksites[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: GestureDetector(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contenxt) => ContentScreen(
                              worksite: worksite,
                            )))
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(worksite.id.toString()),
                      Text(worksite.name.toString()),
                      // worksite['photo'] == null
                      //     ? Text("NULLでした")
                      //     : Image.memory(worksite['photo'])
                      // Image.memory(worksite),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
