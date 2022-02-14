part of 'widgets.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  const CustomBottomNavBar({required this.onTap, required this.selectedIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                onTap(0);
              },
              child: Container(
                width: 24,
                height: 24,
                margin: EdgeInsets.only(left: 36),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icons/home-icon' +
                          ((selectedIndex == 0) ? '.png' : '-1.png')),
                      fit: BoxFit.contain),
                ),
              )),
          GestureDetector(
              onTap: () {
                onTap(1);
              },
              child: Container(
                width: 24,
                height: 24,
                margin: EdgeInsets.only(right: 108, left: 108),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icons/archive-icon' +
                          ((selectedIndex == 1) ? '.png' : '-1.png')),
                      fit: BoxFit.contain),
                ),
              )),
          GestureDetector(
              onTap: () {
                onTap(2);
              },
              child: Container(
                width: 24,
                height: 24,
                margin: EdgeInsets.only(right: 36),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icons/setting-icon' +
                          ((selectedIndex == 2) ? '.png' : '-1.png')),
                      fit: BoxFit.contain),
                ),
              ))
        ],
      ),
    );
  }
}
