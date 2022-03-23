part of 'pages.dart';

class DetailPage extends StatefulWidget {
  // const DetailPage({ Key? key }) : super(key: key);

  static const routeName = '/detail';
  // final RestaurantList restaurant;
  final String id;

  const DetailPage({required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailRestaurantProvider>(
      create: (_) =>
          DetailRestaurantProvider(apiService: ApiService(), id: widget.id),
      child: Scaffold(body:
          Consumer<DetailRestaurantProvider>(builder: (context, state, _) {
        if (state.state == DetailResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (state.state == DetailResultState.HasData) {
            final restaurant = state.detailRestaurant;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                      child: Stack(children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  restaurant.restaurant.getImageId()),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 80,
                      padding: EdgeInsets.symmetric(horizontal: defMargin),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ])),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: defMargin, top: defMargin, bottom: 8),
                        child: Text(
                          restaurant.restaurant.name,
                          style: cafeText,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: defMargin, top: defMargin, right: defMargin),
                    child: Text(
                      restaurant.restaurant.description,
                      style: mainText,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: defMargin,
                      top: defMargin,
                    ),
                    child: Text(
                      "Menu yang Tersedia",
                      style: subtitle2,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16, left: defMargin),
                    child: Text(
                      "Makanan",
                      style: mainText,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(defMargin, 16, defMargin, 0),
                    height: 150,
                    child: FoodWidget(foods: restaurant.restaurant.menus.foods),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16, left: defMargin),
                    child: Text(
                      "Minuman",
                      style: mainText,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        defMargin, 16, defMargin, defMargin),
                    height: 120,
                    child:
                        DrinkWidget(drinks: restaurant.restaurant.menus.drinks),
                  ),
                ],
              ),
            );
          } else if (state.state == DetailResultState.NoData) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Center(
              child: Text(state.message),
            );
          }
        }
      })),
    );
  }
}
