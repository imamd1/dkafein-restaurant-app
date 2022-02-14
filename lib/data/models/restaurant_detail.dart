part of 'models.dart';

class RestaurantList {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  String address;
  List<Category> categories;
  Menus menus;
  double rating;
  List<CustomerReview> customerReviews;

  RestaurantList(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.categories,
      required this.city,
      required this.address,
      required this.customerReviews,
      required this.menus,
      required this.rating});

  factory RestaurantList.fromJson(Map<String, dynamic> json) => RestaurantList(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json['pictureId'],
        city: json['city'],
        address: json['address'],
        menus: Menus.fromJson(json['menus']),
        categories: List<Category>.from(
            json['categories'].map((e) => Category.fromJson(e))),
        rating: json['rating'].toDouble(),
        customerReviews: List<CustomerReview>.from(
            json['customerReviews'].map((e) => CustomerReview.fromJson(e))),
      );

  String getImageId() => ApiService.imgUrl + pictureId;
}
