part of 'providers.dart';

enum DetailResultState { Loading, Error, NoData, HasData }

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  late RestaurantResult _detailRestaurant;
  late DetailResultState _state;
  String _message = '';

  DetailRestaurantProvider({
    required this.id,
    required this.apiService
  }) {
    _getDetailRestaurant(id);
  }

  String get message => _message;
  RestaurantResult get detailRestaurant => _detailRestaurant;
  DetailResultState get state => _state;

  Future<dynamic> _getDetailRestaurant(String id) async {
    try {
      _state = DetailResultState.Loading;
      notifyListeners();
      final detailRestaurant = await apiService.detailRestaurant(id);
      if(detailRestaurant.error) {
        _state = DetailResultState.NoData; 
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = DetailResultState.HasData;
        notifyListeners();
        return _detailRestaurant = detailRestaurant;
      }
    } catch (e) {
      _state = DetailResultState.Error;
      notifyListeners();
      return _message = e.toString();
    }
  }
}