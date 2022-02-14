part of 'widgets.dart';

class FoodWidget extends StatelessWidget {
  // const FoodWidget({Key? key}) : super(key: key);
  final List<Food> foods;

  FoodWidget({required this.foods});

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: foods
            .map((e) => Padding(
                  padding: EdgeInsets.only(
                      left: (e == foods.first) ? 0 : 16,
                      right: (e == foods.last) ? 16 : 0),
                  child: Container(
                    margin: EdgeInsets.only(bottom: defMargin),
                    height: 110,
                    width: 70,
                    decoration: BoxDecoration(                
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.teal.shade100,
                      // boxShadow: [
                      //   BoxShadow(
                      //       blurRadius: 5,
                      //       spreadRadius: 1,
                      //       color: Colors.black26)
                      // ]
                    ),
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
                                    image: AssetImage("assets/icons/salad.png"),
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
