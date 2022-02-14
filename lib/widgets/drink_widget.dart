part of 'widgets.dart';

class DrinkWidget extends StatelessWidget {
  final List<Drink> drinks;

  const DrinkWidget({required this.drinks});
  // const DrinkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: drinks
            .map((e) => Padding(
                  padding: EdgeInsets.only(
                      left: (e == drinks.first) ? 0 : 16,
                      right: (e == drinks.last) ? 16 : 0),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    height: 110,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.teal.shade100),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            margin: EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/icons/sparkling-water.png"),
                                    fit: BoxFit.contain)),
                          ),
                          Container(
                            margin: EdgeInsets.all(8),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  e.name,
                                  style: menuText,
                                )),
                          )
                        ]),
                  ),
                ))
            .toList());
  }
}
