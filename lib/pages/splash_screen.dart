// ignore_for_file: prefer_const_constructors

part of 'pages.dart';

class SplashScreenPage extends StatefulWidget {
  // const SplashScreenPage({ Key? key }) : super(key: key);
  static const routeName = '/splash-screen';

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    counterTime();
  }

  counterTime() async {
    var duration = new Duration(milliseconds: 3500);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, MainPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.orange.shade700,
              Colors.amber,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.fromLTRB(24, 256, 24, 0),
          child: Image(image: AssetImage("assets/images/logo-dcaffe.png")),
        ),
      ],
    );
  }
}
