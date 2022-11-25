import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' show Client;
import 'package:photo_test/model/work_site.dart';

class ApiService {
  final Uri baseUrl = Uri.parse("http://127.0.0.1:8080");
  Client client = Client();

  Future<List<WorkSite>> getAllWorkSites() async {
    final response = await client.get(baseUrl);
    if (response.statusCode == 200) {
      return worksiteFromJsom(response.body);
    } else {
      return worksiteFromJsom(response.body);
    }
  }

  dynamic getWorkSite() async {
    final response = await client.get(Uri.parse(baseUrl.toString() + "/2"));
    if (response.statusCode == 200) {
      // print("OK");
      // dynamic worksite = json.decode(response.body);
      // Uint8List unit8 = base64Decode(response.body);
      // print(worksite['id']);
      // ByteBuffer buffer = response.bodyBytes.buffer;
      // Uint8List uint8list = buffer.asUint8List(
      // response.bodyBytes.offsetInBytes, response.bodyBytes.lengthInBytes);
      // print(uint8list);
      return response.bodyBytes;
    } else {
      return response.body;
    }
  }

  void createWorkSite(WorkSite worksite) async {
    print("create");
    final response = await client.post(baseUrl,
        headers: {"content-type": "application/json"},
        body: worksiteToJson(worksite));
    if (response.statusCode == 200) {
      print("登録成功");
    } else {
      print("登録失敗");
    }
  }

  void delteWorkSite(int id) async {
    final response = await client
        .delete(Uri.parse("http://127.0.0.1:8080/" + id.toString()));
    if (response.statusCode == 200) {
      print("削除できました。");
    } else {
      print("削除できませんでした。");
    }
  }

  void updateWorkSite(WorkSite worksite) async {
    final response = await client.put(baseUrl,
        headers: {"content-type": "application/json"},
        body: worksiteToJson(worksite));

    if (response.statusCode == 200) {
      print("更新できました。");
    } else {
      print("更新できませんでした。");
    }
  }
}
