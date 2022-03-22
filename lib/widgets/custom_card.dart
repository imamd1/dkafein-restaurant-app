part of 'widgets.dart';

class CustomCard extends StatelessWidget {
  // const CustomCard({Key? key}) : super(key: key);

  final RestaurantLists restaurant;

  CustomCard({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigation.intentWithData(DetailPage.routeName, restaurant.id);
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(defMargin, 24, defMargin, 0),
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5, spreadRadius: 1, color: Colors.black26),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(8, 4, 0, 4),
                  child: Text(restaurant.name, style: subtitle2)),
              Container(
                  margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(restaurant.city, style: detailText))
            ],
          ),
        ));
  }
}
