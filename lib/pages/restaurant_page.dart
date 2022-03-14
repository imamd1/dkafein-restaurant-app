// ignore_for_file: prefer_const_literals_to_create_immutables,

part of 'pages.dart';

class RestaurantPage extends StatelessWidget {
  // const RestaurantPage({ Key? key }) : super(key: key);
  static const routeName = '/restaurant-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<RestaurantProvider>(builder: (context, state, _) {
      if (state.state == ResultState.Loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state.state == ResultState.HasData) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(defMargin, 32, defMargin, 0),
                    height: 50,
                    width: 200,
                    // width: double.infinity,
                    // color: Colors.grey,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.topLeft,
                            image: AssetImage('assets/images/dkaffe.png'))),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigation.intentWithData(SearchPage.routeName, '');
                    },
                    child: Container(
                        margin:
                            EdgeInsets.fromLTRB(defMargin, 32, defMargin, 0),
                        height: 32,
                        width: 32,
                        child: Icon(Icons.search),),
                  ),
                ],
              ),
              SizedBox(width: 16,),
              Container(margin: EdgeInsets.fromLTRB(defMargin, 32, defMargin, 0),
              child: Text('Daftar Restaurant', style: subtitle1,),),
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
        return Center(
          child: Text(state.message),
        );
      } else if (state.state == ResultState.Error) {
        return Center(
          child: Text(state.message),
        );
      } else {
        return Center(
          child: Text(''),
        );
      }
    }));
  }
}
