import 'dart:convert';
import 'dart:io';

import 'package:submission2_flutter_fundamental_dicoding_bloc/common/shared_value.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_detail.dart';
import 'package:http/http.dart' as http;

class RestaurantDetailServices {
  static Future<RestaurantDetail> ambilDetailResto(String id) async {
    try {
      String url = baseURL + 'detail/' + id;
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        return RestaurantDetail.fromJson(data);
      } else {
        throw Exception('Ambil Data Gagal');
      }
    } on SocketException {
      return RestaurantDetail.fromJsonNo();
    }
  }
}
