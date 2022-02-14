// ignore_for_file: prefer_const_constructors_in_immutables

part of 'widgets.dart';

class CafeCard extends StatelessWidget {
  // const CafeCard({Key? key}) : super(key: key);
  final Restaurant restaurant;

  CafeCard(this.restaurant);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName,
            arguments: restaurant);
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(bottom: defMargin),
        height: 157,
        width: 228,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 5, spreadRadius: 1, color: Colors.black26)
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 106,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(
                  image: NetworkImage(restaurant.pictureId), fit: BoxFit.cover),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(8, 8, 0, 0),
                  child: Text(
                    restaurant.name,
                    style: mainText,
                  )),
              Container(
                width: 35,
                height: 15,
                margin: EdgeInsets.fromLTRB(32, 8, 8, 0),
                // decoration: BoxDecoration(
                //   color: Colors.black,
                //   borderRadius: BorderRadius.circular(5),
                // ),
                child: RatingStar(restaurant),
              )
            ],
          ),
          Container(
              margin: EdgeInsets.fromLTRB(8, 2, 0, 8),
              child: Text(
                restaurant.city,
                style: detailText,
              ))
        ]),
      ),
    );
  }
}
