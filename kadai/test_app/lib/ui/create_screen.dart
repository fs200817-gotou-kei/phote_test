import 'package:flutter/material.dart';
import 'package:test_app/model/work_site.dart';
import 'package:test_app/ui/form_screen.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  late WorkSite worksite;

  @override
  void initState() {
    worksite = new WorkSite(
        null, "", null, "", "", "", "", "", null, null, null, null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("現場追加")),
      body: Container(
        child: Column(children: [
          FormScreen(worksite),
          // ElevatedButton(
          //     onPressed: () {
          //       ApiService apiService = ApiService();
          //       worksite == null
          //           ? print("NULL")
          //           : apiService.createWorkSite(worksite);
          //       Navigator.pop(context,
          //           MaterialPageRoute(builder: (context) => HomeScreen()));
          //     },
          //     child: Text("保存"))
        ]),
      ),
    );
  }
}
