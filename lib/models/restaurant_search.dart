import 'package:equatable/equatable.dart';

class RestaurantSearch extends Equatable {
  RestaurantSearch({
    this.error,
    this.message,
    this.restaurants,
  });

  final bool error;
  final String message;
  final List<Restaurantss> restaurants;

  factory RestaurantSearch.fromJson(Map<String, dynamic> json) =>
      RestaurantSearch(
        error: json["error"],
        message: json["message"] ?? "Data Gagal",
        restaurants: List<Restaurantss>.from(
            json["restaurants"].map((x) => Restaurantss.fromJson(x))),
      );

  factory RestaurantSearch.fromJsonNo() =>
      RestaurantSearch(
        error: true,
        message: "Tidak Ada Internet\nPeriksalah Koneksi Anda!",
        restaurants: [],
      );

  @override
  List<Object> get props => [restaurants, message, error];
}

class Restaurantss {
  Restaurantss({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  factory Restaurantss.fromJson(Map<String, dynamic> json) => Restaurantss(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
      );
}
