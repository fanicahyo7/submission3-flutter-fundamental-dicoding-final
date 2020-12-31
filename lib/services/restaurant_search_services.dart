import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/shared_value.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_search.dart';

class RestaurantSearchServices {
  static Future<RestaurantSearch> ambilSearchResto(String parameter) async {
    try {
      String url = baseURL + 'search?q=' + parameter;
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        return RestaurantSearch.fromJson(data);
      } else {
        throw Exception('Ambil Data Gagal');
      }
    } on SocketException {
      return RestaurantSearch.fromJsonNo();
    }
  }
}
