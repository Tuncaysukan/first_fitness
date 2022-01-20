import 'package:fitness_first/pages/screens.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int time = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          profileDetail(),
          divider(),
          aboutDetail(),
          workoutDetail(),
        ],
      ),
    );
  }

  profileDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Row(
        children: [
          Hero(
            tag: 'profilePic',
            child: Container(
              height: 65,
              width: 65,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/users/user7.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          widthSpace,
          widthSpace,
          widthSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Samantha John',
                  style: black18SemiBoldTextStyle,
                ),
                Text(
                  '+91 1234567890',
                  style: grey13RegularTextStyle,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfile()),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: fixPadding * 4.3),
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: blackColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.edit,
                color: whiteColor,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  aboutDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace,
        heightSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'ABOUT',
            style: grey13BoldTextStyle,
          ),
        ),
        heightSpace,
        heightSpace,
        detail(
          title: 'My Trainer',
          ontap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyTrainer()),
          ),
        ),
        detail(
          title: 'Favorite List',
          ontap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FavoriteList()),
          ),
        ),
        detail(
          title: 'Notifications',
          ontap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Notifications()),
          ),
        ),
        detail(
          title: 'Premium Plan',
          ontap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PremiumPlans()),
          ),
        ),
        detail(
          title: 'Share with Friends',
          ontap: () {},
        ),
        detail(
          title: 'Privacy Policy',
          ontap: () {},
        ),
        detail(
          title: 'Terms of Use',
          ontap: () {},
        ),
        divider(),
      ],
    );
  }

  workoutDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace,
        heightSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'Workout',
            style: grey13BoldTextStyle,
          ),
        ),
        heightSpace,
        heightSpace,
        detail(
          title: 'Goal',
          ontap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DailyGoal()),
          ),
        ),
        detail(
          title: 'Set Training Rest',
          ontap: () => restDialog(),
        ),
        heightSpace,
        heightSpace,
        InkWell(
          onTap: () => logoutDialog(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Text(
              'Logout',
              style: primaryColor14BoldTextStyle,
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        heightSpace,
      ],
    );
  }

  detail({String title, Function ontap}) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: fixPadding * 1.2,
          horizontal: fixPadding * 2.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: black16MediumTextStyle,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: fixPadding * 2.0),
        color: greyColor,
        height: 1,
        width: double.infinity,
      ),
    );
  }

  restDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(fixPadding * 1.5),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Set Training Rest (5 ~ 180 secs)',
                            style: black16SemiBoldTextStyle,
                          ),
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    time = time == 5 ? 5 : time - 5;
                                  });
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                ),
                              ),
                              Container(
                                width: 140,
                                alignment: Alignment.center,
                                child: Text(
                                  '$time sec',
                                  style: grey20RegularTextStyle,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    time = time == 180 ? 180 : time + 5;
                                  });
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Text(
                                  'Cancel',
                                  style: grey15SemiBoldTextStyle,
                                ),
                              ),
                              widthSpace,
                              widthSpace,
                              widthSpace,
                              InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Text(
                                  'Set',
                                  style: primaryColor15SemiBoldTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

  logoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding * 3.0,
                  vertical: fixPadding * 1.5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sure you want to logout?',
                      style: black16SemiBoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(fixPadding),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                border: Border.all(color: primaryColor),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                'Logout',
                                style: white18BoldTextStyle,
                              ),
                            ),
                          ),
                        ),
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.all(fixPadding),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: primaryColor),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                'Cancel',
                                style: primaryColor18BoldTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
