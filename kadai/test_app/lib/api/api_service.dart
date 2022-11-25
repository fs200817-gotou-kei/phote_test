import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' show Client;
import 'package:test_app/model/work_site.dart';

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

  Future<List<WorkSite>> getWWorkSite() async {
    final response = await client.get(baseUrl);
    if (response.statusCode == 200) {
      return worksiteFromJsom(response.body);
    } else {
      return worksiteFromJsom(response.body);
    }
  }

  void createWorkSite(WorkSite worksite) async {
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
