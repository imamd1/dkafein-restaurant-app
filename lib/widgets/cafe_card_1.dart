part of 'widgets.dart';

class CafeListCard extends StatelessWidget {
  // const CafeListCard({Key? key}) : super(key: key);

  final RestaurantLists restaurant;

  const CafeListCard({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
           Navigation.intentWithData(DetailPage.routeName, restaurant.id);
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(defMargin, 24, defMargin, 0),
          width: 312,
          height: 170,
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
                height: 118,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                        image: NetworkImage(restaurant.getImageId()),
                        fit: BoxFit.cover)),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(12, 4, 0, 4),
                child: Text(
                  restaurant.name,
                  style: mainText,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(12, 0, 0, 4),
                child: Text(
                  restaurant.city,
                  style: detailText,
                ),
              )
            ],
          ),
        ));
  }
}
