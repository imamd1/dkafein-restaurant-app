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
    return ChangeNotifierProvider<SearchProvider>(
      create: (_) => SearchProvider(apiService: ApiService()),
      child: Consumer<SearchProvider>(builder: (context, state, _) {
        if (state.state == SearchState.Loading) {
          return Center(
              child: Container(
            child: Text('Cari Restoran mu'),
          ));
        } else if (state.state == SearchState.HasData) {
          state.fetchSearchRestaurant(queries);
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
          state.fetchSearchRestaurant(queries);
          return Center(child: Text(state.message));
        } else if (state.state == SearchState.Error) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Center(
            child: Text(''),
          );
        }
      }),
    );
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
            Container(
              color: bgColor,
            ),
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
                          hintText: "Cari Binatang...",
                          hintStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          )),
                    ))),
            Center(
              child: queries.isEmpty
                  ? Center(
                      child: Text('kosoong'),
                    )
                  : _searchResultData(context),
            )
          ],
        ));
      }),
    );
  }
}
