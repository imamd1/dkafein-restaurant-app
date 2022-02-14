part of 'models.dart';

class RestaurantResult {
  RestaurantResult({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  bool error;
  String message;
  RestaurantList restaurant;

  factory RestaurantResult.fromJson(Map<String, dynamic> json) =>
      RestaurantResult(
          error: json['error'],
          message: json['message'],
          restaurant: RestaurantList.fromJson(json['restaurant']));
}
