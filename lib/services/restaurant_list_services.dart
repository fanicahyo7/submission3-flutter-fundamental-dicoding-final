import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/shared_value.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_list.dart';

class RestaurantListServices {
  static Future<RestaurantList> ambilRestoList() async {
    try {
      String url = baseURL + 'list';
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return RestaurantList.fromJson(data);
      } else {
        throw Exception('Ambil Data Gagal');
      }
    } on SocketException {
      return RestaurantList.fromJsonNo();
    }
  }
}
