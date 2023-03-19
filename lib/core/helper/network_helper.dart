import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nghia_flutter_clean/core/entity/remote_response.dart';

Future<RemoteResponse<Map<String, dynamic>>> httpGet(http.Client httpClient, String token, String url) async {
  final response = await httpClient.get(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
      // 'Authorization': 'Bearer $token'
    },
  );

  // Map data response
  RemoteResponse<Map<String, dynamic>> result = RemoteResponse(
    data: json.decode(response.body),
    statusCode: response.statusCode  // 200, 404
  );

  return result;
}

enum RequestMethod { GET, POST, PATCH, DELETE, PUT }

Future<dynamic> apiRequest({
  required String url,
  required RequestMethod method,
  dynamic body,
}) async {
  try {
    http.Response response;
    final Uri uri = Uri.parse(url);

    switch (method) {
      case RequestMethod.GET:
        response = await http.get(uri);
        break;
      case RequestMethod.POST:
        response = await http.post(uri, body: jsonEncode(body));
        break;
      case RequestMethod.PATCH:
        response = await http.patch(uri, body: jsonEncode(body));
        break;
      case RequestMethod.PUT:
        response = await http.put(uri, body: jsonEncode(body));
        break;
      case RequestMethod.DELETE:
        response = await http.delete(uri);
        break;
      default:
        response = await http.get(uri);
    }
    final jsonData = jsonDecode(response.body);
    return Future.value(jsonData);
  } catch (e) {
    rethrow;
  }
}