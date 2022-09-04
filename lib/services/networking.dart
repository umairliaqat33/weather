import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      log(response.statusCode.toString());
    }
  }
}
