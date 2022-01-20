import 'package:fitness_first/pages/screens.dart';

class HealthTips extends StatefulWidget {
  const HealthTips({Key key}) : super(key: key);

  @override
  _HealthTipsState createState() => _HealthTipsState();
}

class _HealthTipsState extends State<HealthTips> {
  final tipsList = [
    {
      'image': 'assets/tips/tip1.png',
      'title': 'Be Active',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad.',
      'isFavorite': false,
    },
    {
      'image': 'assets/tips/tip2.png',
      'title': 'Avoid harmful use of alcohol',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad.',
      'isFavorite': false,
    },
    {
      'image': 'assets/tips/tip3.png',
      'title': 'Eat a healthy diet',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad.',
      'isFavorite': false,
    },
    {
      'image': 'assets/tips/tip4.png',
      'title': 'Drink only safe water',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad.',
      'isFavorite': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Health Tips',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: tips(),
    );
  }

  tips() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: tipsList.length,
      itemBuilder: (context, index) {
        final item = tipsList[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            0,
            fixPadding * 2.0,
            fixPadding * 2.0,
          ),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HealthTipDetails(
                  tag: tipsList[index],
                  image: item['image'],
                  tip: item['title'],
                ),
              ),
            ),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ClipPath(
                clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Hero(
                          tag: tipsList[index],
                          child: Image.asset(
                            item['image'],
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.13,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 5,
                          right: 5,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                item['isFavorite'] = !item['isFavorite'];
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: item['isFavorite']
                                    ? Text(
                                        '${item['title']} Add To Favorite List.')
                                    : Text(
                                        '${item['title']} Remove From Favorite List.'),
                              ));
                            },
                            child: Icon(
                              item['isFavorite']
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(fixPadding / 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'],
                            style: black15SemiBoldTextStyle,
                          ),
                          heightSpace,
                          Text(
                            item['description'],
                            style: grey13RegularTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
