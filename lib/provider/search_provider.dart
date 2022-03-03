part of 'providers.dart';

enum SearchState { Loading, NoData, HasData, Error }

class SearchProvider extends ChangeNotifier {
  final ApiService apiService;
  // final String query;

  SearchProvider({required this.apiService}) {
    fetchSearchRestaurant(query);
  }

  SearchRestaurantResult? _searchResult;
  SearchState? _state;
  String _message = '';
  String _query = '';

  String get message => _message;
  SearchRestaurantResult? get result => _searchResult;
  SearchState? get state => _state;
  String get query => _query;

  Future<dynamic> fetchSearchRestaurant(String query) async {
    try {
      _state = SearchState.Loading;
      _query = query;
      final search = await apiService.searchRestaurant(query);
      if (search.restaurants.isEmpty) {
        _state = SearchState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = SearchState.HasData;
        notifyListeners();
        return _searchResult = search;
      }
      // if (query.isNotEmpty) {
      //   _state = SearchState.Loading;
      //   _query = query;
      //   final search = await apiService.searchRestaurant(query);
      //   if (search.restaurants.isEmpty) {
      //     _state = SearchState.NoData;
      //     notifyListeners();
      //     return _message = 'Empty Data';
      //   } else {
      //     _state = SearchState.HasData;
      //     notifyListeners();
      //     return _searchResult = search;
      //   }
      // }
    } catch (e) {
      _state = SearchState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
