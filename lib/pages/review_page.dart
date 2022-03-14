part of 'pages.dart';

class ReviewPage extends StatelessWidget {
  static final routeName = '/post-review';
  final String id;

  ReviewPage({required this.id});
  // const ReviewPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // Form(child: child)
            Container(child: Text('Tulis Review '))
          ],
        ),
      ),
    );
  }
}