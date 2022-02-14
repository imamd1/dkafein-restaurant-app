part of 'widgets.dart';

class RatingStar extends StatelessWidget {
  final Restaurant restaurant;

  const RatingStar(this.restaurant);
  @override
  Widget build(BuildContext context) {
    // double rate = double.parse(restaurant.rating);
    // int numOfStar = rate.round();
    return Row(
      children:
          // List<Widget>.generate(
          //         5,
          //         (index) => Icon(
          //               (index < numOfStar) ? MdiIcons.star : MdiIcons.starOutline,
          //               size: 16,
          //               color: Colors.amber,
          //             )) +
          [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/icons/star-fill.png")
            )
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          restaurant.rating,
          style: ratingText ,
        )
      ],
    );
  }
}
