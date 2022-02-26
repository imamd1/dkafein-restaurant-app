// ignore_for_file: prefer_const_literals_to_create_immutables,

part of 'pages.dart';

class RestaurantPage extends StatelessWidget {
  // const RestaurantPage({ Key? key }) : super(key: key);
  static const routeName = '/restaurant-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RestaurantProvider>(
        builder: (context, state, _ ) {
          if(state.state == ResultState.Loading) {
            return Center(child: CircularProgressIndicator(),);

          } else if (state.state == ResultState.HasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigation.intentWithData(SearchPage.routeName, '');
                    },
                    child: Container(
                      margin: EdgeInsets.all(defMargin),
                      height: 50,
                      width: 50,
                      color: Colors.amber
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.result.restaurants.length,
                    itemBuilder: (context, index) {
                      var restaurant = state.result.restaurants[index];
                      return CafeListCard(restaurant: restaurant);
                    }),
                ],
              ),
            );
          } else if (state.state == ResultState.NoData) {
            return Center(child: Text(state.message),);
          } else if (state.state == ResultState.Error) {
            return Center(child: Text(state.message),);
          } else  {
            return Center(child: Text(''),);
          } 
        }
      )
    );
  }
}


// class RestaurantPage extends StatelessWidget {
//   // const RestaurantPage({ Key? key }) : super(key: key);
//   static const routeName = '/restaurant-page';

//   @override
//   Widget build(BuildContext context) {
//     // Future<String> loadData =
//     //     DefaultAssetBundle.of(context).loadString('assets/restaurant.json');
//     Future<RestaurantResult> _restaurantResult;
//     return Scaffold(
//       body: ListView(
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         children: [
//           SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               // mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                     height: 50,
//                     // padding: EdgeInsets.only(left: defMargin),
//                     margin: EdgeInsets.fromLTRB(defMargin, 32, defMargin, 32),
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             alignment: Alignment.topLeft,
//                             image: AssetImage("assets/images/dkaffe.png")))),
//                 Container(
//                   margin: EdgeInsets.only(left: defMargin, bottom: 16),
//                   child: Text(
//                     "Yang jadi favorit",
//                     style: subtitle1,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 200,
//                   child: Container(
//                     child: FutureBuilder(
//                         future: _restaurantResult,
//                         builder: (context, AsyncSnapshot<RestaurantResult> snapshot) {
//                           var state = snapshot.connectionState;
//                           // final List<Restaurant> restaurants =
//                           //     parseRestaurants(snapshot.data);
//                           if (state != ConnectionState.done) {
//                             return CircularProgressIndicator();
//                           } else {
//                             return ListView(
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             children: [
//                               Row(
//                                 children: restaurants
//                                     .map((e) => Padding(
//                                           padding: EdgeInsets.only(
//                                             left: (e == restaurants.first)
//                                                 ? 24
//                                                 : 0,
//                                             right: 24,
//                                           ),
//                                           child: CafeCard(e),
//                                         ))
//                                     .toList(),
//                               )
//                             ],
//                           );
//                           }
//                         }),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: defMargin),
//                   child: Text(
//                     "Daftar Restaurant",
//                     style: subtitle1,
//                   ),
//                 ),
//                 Container(
//                     margin: EdgeInsets.only(bottom: 64),
//                     child: FutureBuilder<String>(
//                         future: loadData,
//                         builder: (context, snapshot) {
//                           final List<Restaurant> restaurants =
//                               parseRestaurants(snapshot.data);
//                           return ListView.builder(
//                             physics: NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: restaurants.length,
//                               itemBuilder: (context, index) {
//                                 final Restaurant restaurant =
//                                     restaurants[index];
//                                 // if (restaurant.rating >= 4) {
//                                 return CafeListCard(restaurant);
//                                 // } else {
//                                 //   return const Text("Data tidak ditemukan");
//                                 // }
//                               });
//                         }))
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
