part of 'models.dart';

class SearchRestaurantResult {
  SearchRestaurantResult({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  bool error;
  int founded;
  List<RestaurantLists> restaurants;

  factory SearchRestaurantResult.fromJson(Map<String, dynamic> json) =>
      SearchRestaurantResult(
          error: json['error'],
          founded: json['founded'],
          restaurants: List<RestaurantLists>.from(
              json['restaurants'].map((e) => RestaurantLists.fromJson(e))));
}
