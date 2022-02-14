// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace

part of 'pages.dart';

class MainPage extends StatefulWidget {
  // const MainPage({ Key? key }) : super(key: key);
  final int initiialPage;

  const MainPage({this.initiialPage = 0});

  static const routeName = '/main-page';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int selectedPage;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    selectedPage = widget.initiialPage;
    pageController = PageController(initialPage: widget.initiialPage);  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: bgColor,
        ),
        SafeArea(child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              selectedPage = index;
            });
          },
          children: [
            ChangeNotifierProvider<RestaurantProvider>(
              create: (_) => RestaurantProvider(apiService: ApiService()),
              child: RestaurantPage()),
            FavoritePage(),
            SettingPage(),
          ],
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomBottomNavBar(
             selectedIndex: selectedPage,
            onTap: (index) {
              setState(() {
                selectedPage = index;
              });
              pageController.jumpToPage(selectedPage);
            }),
        )
      ],
    );
  }
  }