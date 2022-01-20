import 'package:fitness_first/pages/screens.dart';

class HealthTipDetails extends StatefulWidget {
  final Object tag;
  final String image;
  final String tip;
  const HealthTipDetails({Key key, this.tag, this.image, this.tip})
      : super(key: key);

  @override
  _HealthTipDetailsState createState() => _HealthTipDetailsState();
}

class _HealthTipDetailsState extends State<HealthTipDetails> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: nestedScrollView(),
      ),
    );
  }

  nestedScrollView() {
    return NestedScrollView(
      headerSliverBuilder: (context, b) {
        return [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            titleSpacing: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: whiteColor,
              ),
            ),
            title: Text(
              'Health Tips',
              style: white18SemiBoldTextStyle,
            ),
            flexibleSpace: Hero(
              tag: widget.tag,
              child: Image.asset(
                widget.image,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ];
      },
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          dietTips(),
          nutritionTips(),
        ],
      ),
    );
  }

  dietTips() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.tip,
                style: black15SemiBoldTextStyle,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: isFavorite
                        ? Text('${widget.tip} Add To Favorite List.')
                        : Text('${widget.tip} Remove From Favorite List.'),
                  ));
                },
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 20,
                ),
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          Text(
            '• Vegetables and legumes or beans.',
            style: black13MediumTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            '• Fruit',
            style: black13MediumTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            '• Grain (cereal) foods, mostly wholegrain or high cereal fibre varieties.',
            style: black13MediumTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            '• Milk, yoghurt, cheese or alternatives, mostly reduced fat.',
            style: black13MediumTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad.',
            style: grey13RegularTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: grey13RegularTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.',
            style: grey13RegularTextStyle,
          ),
        ],
      ),
    );
  }

  nutritionTips() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nutrition Tips For You',
            style: black15SemiBoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            '• Eat oily fish',
            style: black14SemiBoldTextStyle,
          ),
          heightSpace,
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad.',
            style: grey13RegularTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            '• Eat whole grains',
            style: black14SemiBoldTextStyle,
          ),
          heightSpace,
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad.',
            style: grey13RegularTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            '• Drink water',
            style: black14SemiBoldTextStyle,
          ),
          heightSpace,
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad.',
            style: grey13RegularTextStyle,
          ),
        ],
      ),
    );
  }
}
