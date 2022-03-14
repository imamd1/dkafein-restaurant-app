part of 'pages.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  String queries = '';

  // const SearchPage({ Key? key }) : super(key: key);
  Widget _searchResultData(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, state, _) {
      if (state.state == SearchState.Loading) {
        return Center(
            child: Container(
          child: Text('Cari Restoran mu'),
        ));
      } else if (state.state == SearchState.HasData) {
        // state.fetchSearchRestaurant(queries);
        return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result!.restaurants.length,
            itemBuilder: (context, index) {
              var restaurant = state.result!.restaurants[index];
              return ListTile(
                title: Text(restaurant.name),
              );
            });
      } else if (state.state == SearchState.NoData) {
        // state.fetchSearchRestaurant(queries);
        return Center(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 200),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icons/folder-not-found.png'))),
            ),
            Container(child: Text('Opps, restaurant yang kamu cari tidak ada', style: resultText,),)
          ],
        ));
      } else if (state.state == SearchState.Error) {
        return Center(
          child: Text(state.message),
        );
      } else {
        return Center(
          child: Text(''),
        );
      }
    });
  }

  Widget _restaurantResult(BuildContext context) {
    return Consumer<RestaurantProvider>(builder: (context, state, _) {
      if(state.state == ResultState.Loading) {
        return CircularProgressIndicator();
      } else if (state.state == ResultState.HasData) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.result.restaurants.length,
          itemBuilder: (builder, index) {
            final restaurant = state.result.restaurants[index];
            return ListTile(title: Text(restaurant.name));
          },
        );
      } else if (state.state == ResultState.NoData) {
        return Center(child: Text(state.message),);
      } else if (state.state == ResultState.Error) {
        return Center(child: Text(state.message),);
      } else {
        return Center(child: Text(''),);
      }
    },);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchProvider>(
      create: (_) => SearchProvider(
        apiService: ApiService(),
      ),
      child: Consumer<SearchProvider>(builder: (context, state, _) {
        return Scaffold(
            body: Stack(
          children: [
            SafeArea(
                child: Container(
              color: bgColor,
            )),
            SafeArea(
                child: Container(
                    margin: EdgeInsets.fromLTRB(24, 48, 24, 48),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          queries = value;
                        });
                        state.fetchSearchRestaurant(value);
                        // if (value.isNotEmpty) {
                        // }
                      },
                      autofocus: true,
                      cursorColor: bgColor,
                      controller: _controller,
                      decoration: InputDecoration(
                          filled: true,
                          hintText: "Cari Restaurant...",
                          hintStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          )),
                    ))),
            SafeArea(
              child: Center(
                child: queries.isEmpty
                    ? _restaurantResult(context) : Text('')
                    // : _searchResultData(context),
              ),
            )
          ],
        ));
      }),
    );
  }
}
