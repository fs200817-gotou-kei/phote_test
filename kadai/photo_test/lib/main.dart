import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_test/api/api_service.dart';
import 'package:photo_test/model/work_site.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NotoSansJP'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Uint8List? _photo;
  final picker = ImagePicker();
  ApiService apiService = ApiService();
  bool a = true;
  Client client = Client();

  @override
  void initState() {
    super.initState();
  }

  getWorkSite() async {
    final response = await client.get(Uri.parse("http://127.0.0.1:8080/1"));
    _photo = response.bodyBytes;
    setState(() {});
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Sample'),
      ),
      body: Column(
        children: [
          Image.network("http://127.0.0.1:8080/1"),
          Center(
            child: a ? Text("変換中") : Image.network("http://127.0.0.1:8080/1"),
          ),
          // Center(
          //     child: _image == ""
          //         ? Text('No image selected.')
          //         : Text('No image selected.')
          //     // : Image.memory(),
          //     ),
          ElevatedButton(
              onPressed: () async {
                a = false;
                // ApiService apiService = ApiService();
                // _photo = await apiService.getWorkSite();
                // print(_photo);

                // // ByteData byte = ByteData(work['photo']);
                // a = false;
                // setState(() {});
                // WorkSite worksite = new WorkSite(work['id'], null);
                // _image = apiService.getWorkSite();
              },
              child: Text('取得')),
          ElevatedButton(
              onPressed: () {
                ApiService apiService = ApiService();
                // WorkSite worksite = new WorkSite(null, _photo);
                // apiService.createWorkSite(worksite);
              },
              child: Text("作成"))
        ],
      ),
      floatingActionButton: Center(
        child: FloatingActionButton(
          onPressed: getImage,
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }
}
