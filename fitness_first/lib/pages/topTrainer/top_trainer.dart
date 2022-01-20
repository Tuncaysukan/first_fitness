import 'package:fitness_first/pages/screens.dart';

class TopTrainer extends StatefulWidget {
  final Object tag;
  final String image;
  final String name;
  final String type;
  const TopTrainer({Key key, this.tag, this.image, this.name, this.type})
      : super(key: key);

  @override
  State<TopTrainer> createState() => _TopTrainerState();
}

class _TopTrainerState extends State<TopTrainer> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: nestedScrollView(),
      ),
      bottomNavigationBar: button(),
    );
  }

  nestedScrollView() {
    return NestedScrollView(
      headerSliverBuilder: (context, b) {
        return [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            backgroundColor: primaryColor,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            flexibleSpace: Hero(
              tag: widget.tag,
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ];
      },
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        children: [
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            widget.name,
            style: black18SemiBoldTextStyle,
          ),
          Row(
            children: [
              Text(
                widget.type,
                style: grey14RegularTextStyle,
              ),
              widthSpace,
              widthSpace,
              widthSpace,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '1.5K ',
                      style: primaryColor14RegularTextStyle,
                    ),
                    TextSpan(
                      text: 'Followers',
                      style: grey14RegularTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          divider(),
          aboutDetail(),
        ],
      ),
    );
  }

  aboutDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: black16SemiBoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          '    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et di dolore magna aliqua.',
          style: grey13RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          '    Duis aute irure dolor in reprehenderit in voluptate      elit esse cillum dolore eu fugiat nulla pariatur.  ',
          style: grey13RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          '    Excepteur sint occaecat cupidatat non proident, sut sunt in culpa qui officia deserunt mollit anim id est lai laboreii laborum Sed ut perspiciatis unde omnis iste natus sirt error sit voluptatem.',
          style: grey13RegularTextStyle,
        ),
      ],
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: fixPadding * 2.3),
      color: greyColor,
      height: 0.5,
      width: double.infinity,
    );
  }

  button() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Message(
                    name: widget.name,
                    type: widget.type,
                  ),
                ),
              ),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  'Message',
                  style: white18BoldTextStyle,
                ),
              ),
            ),
          ),
          widthSpace,
          widthSpace,
          widthSpace,
          widthSpace,
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isFollowing = !isFollowing;
                });
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  isFollowing ? 'Following' : 'Follow',
                  style: primaryColor18BoldTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
