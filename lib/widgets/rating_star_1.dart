part of 'widgets.dart';

class Stars extends StatelessWidget {
  final Restaurant restaurant;

  const Stars(this.restaurant);

  @override
  Widget build(BuildContext context) {
    double rate = double.parse(restaurant.rating);
    int numOfStar = rate.round();

    return Row(
        children: List<Widget>.generate(
            5,
            (index) => Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                    (index < numOfStar)
                        ? 'assets/icons/star-fill.png'
                        : 'assets/icons/star-border.png',
                  ))),
                )));
  }
}
