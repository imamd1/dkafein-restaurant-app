part of 'models.dart';

class RestaurantResults {
  RestaurantResults({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  bool error;
  String message;
  int count;
  List<RestaurantLists> restaurants;

  factory RestaurantResults.fromJson(Map<String, dynamic> json) =>
      RestaurantResults(
          error: json['error'],
          message: json['message'],
          count: json['count'],
          restaurants: List<RestaurantLists>.from(
            json['restaurants'].map((e) => RestaurantLists.fromJson(e)),
          ));

  get itemBuilder => null;    
}
