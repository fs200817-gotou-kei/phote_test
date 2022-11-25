import 'dart:html';

import 'package:http/http.dart' show Client;

import '../model/profile.dart';

class ApiService {
  final Uri baseUrl = Uri.parse("http://127.0.0.1:8080");
  Client client = Client();

  Future<List<Profile>> getProfiles() async {
    final response = await client.get(baseUrl);
    if (response.statusCode == 200) {
      return profileFromJson(response.body);
    } else {
      return profileFromJson(response.body);
    }
  }

  Future<bool> createProfile(Profile data) async {
    final response = await client.post(
      baseUrl,
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    if (response.statusCode == 201) {
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
