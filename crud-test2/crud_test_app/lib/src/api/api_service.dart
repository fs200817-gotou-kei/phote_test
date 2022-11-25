import 'package:crud_test_app/src/model/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' show Client;

class ApiService {
  final Uri baseUrl = Uri.parse("http://127.0.0.1:8080");
  Client client = Client();

  Future<List<Profile>> getProfiles() async {
    final response = await client.get(baseUrl);

    // httpモジュールを使ってapiから取得したデータはjsonの状態なのでそれをProfile型に変換する
    if (response.statusCode == 200) {
      return profileFromJson(response.body);
    } else {
      return profileFromJson(response.body);
    }
  }

  Future<bool> createProfile(Profile data) async {
    final response = await client.post(
      baseUrl,

      // TODO:headerはいるのかな？jsonで送ることの保証？
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProfile(Profile data) async {
    final url = Uri.parse("http://127.0.0.1:8080/${data.id}");
    final response = await client.put(
      url,
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProfile(int id) async {
    final url = Uri.parse("http://127.0.0.1:8080/$id");
    final response = await client.delete(
      url,
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
