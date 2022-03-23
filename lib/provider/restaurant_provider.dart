part of 'providers.dart';

enum ResultState { NoData, HasData, Error, Loading }

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService}) {
    _fetchRestaurants();
  }

  late RestaurantResults _restaurantResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantResults get result => _restaurantResult;

  ResultState get state => _state;

  Future<dynamic> _fetchRestaurants() async {
    try {
      _state = ResultState.Loading;
      final restaurant = await apiService.getRestaurantLists();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Whoops. Kamu tidak tersambung dengan Internet!';
    }
  }
}
