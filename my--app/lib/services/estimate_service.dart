import 'dart:convert';

import 'package:http/http.dart' as http;

class EstimateService {
  EstimateService();

  getAllEstimates() async {
    // 下のUriの使いかたを知る必要がある
    var url = Uri(
        scheme: 'http',
        host: '127.0.0.1',
        port: 8080,
        path: '/api/v1/estimates');
    var response = await http.get(url);
    final a = jsonDecode(utf8.decode(response.body.runes.toList()))
        as Map<String, dynamic>;
    return a;
  }
}
