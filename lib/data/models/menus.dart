// ignore_for_file: unnecessary_new, prefer_collection_literals

part of 'models.dart';

class Menus {
  late List<Food> foods;
  late List<Drink> drinks;

  Menus(this.foods, this.drinks);

  Menus.fromJson(Map<String, dynamic> menu) {
    if (menu['foods'] != null) {
      foods = <Food>[];
      menu['foods'].forEach((v) {
        foods.add(new Food.fromJson(v));
      });
    }

    if (menu['drinks'] != null) {
      drinks = <Drink>[];
      menu['drinks'].forEach((v) {
        drinks.add(new Drink.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['food'] = food.map((v) => v.toJson()).toList();
  //   data['drink'] = drink.map((v) => v.toJson()).toList();
  //   return data;
  // }
}
