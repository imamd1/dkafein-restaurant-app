part of 'models.dart';

class RestaurantLists {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  RestaurantLists(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating});

  factory RestaurantLists.fromJson(Map<String, dynamic> json) =>
      RestaurantLists(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json['pictureId'],
        city: json['city'],
        rating: json['rating'].toDouble(),
      );

  String getImageId() => ApiService.imgUrl + pictureId;
}
