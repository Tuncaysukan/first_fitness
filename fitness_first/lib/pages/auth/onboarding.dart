import 'dart:async';
import 'dart:io';

import 'package:fitness_first/pages/screens.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final pageViewController = PageController(initialPage: 0);
  int currentPage = 0;
  DateTime currentBackPressTime;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 5),
      (Timer time) {
        if (currentPage < 2) {
          currentPage++;
        } else {
          currentPage = 0;
        }
        pageViewController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool backStatus = onWillPop();
        if (backStatus) {
          exit(0);
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageViewController,
                scrollDirection: Axis.horizontal,
                onPageChanged: onChanged,
                children: [
                  page1(),
                  page2(),
                  page3(),
                ],
              ),
            ),
            pageIndicator(),
          ],
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }

  pageIndicator() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 7.5,
        fixPadding * 2.0,
        fixPadding * 2.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          currentPage != 2
              ? InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  ),
                  child: Text(
                    'Skip',
                    style: white13SemiBoldTextStyle,
                  ),
                )
              : Container(),
          SmoothPageIndicator(
            controller: pageViewController,
            count: 3,
            effect: const WormEffect(
              spacing: 8.0,
              dotColor: Color(0xffdbdbdb),
              activeDotColor: whiteColor,
            ),
          ),
          currentPage == 2
              ? InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  ),
                  child: Text(
                    'Login',
                    style: white13SemiBoldTextStyle,
                  ),
                )
              : InkWell(
                  onTap: () {
                    setState(() {
                      currentPage++;
                    });
                    pageViewController.animateToPage(
                      currentPage,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text(
                    'Next',
                    style: white13SemiBoldTextStyle,
                  ),
                ),
        ],
      ),
    );
  }

  page1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Image.asset(
          'assets/fitness.png',
          height: 280,
          width: 250,
          fit: BoxFit.cover,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'FITNESS',
          style: white20SemiBoldTextStyle,
        ),
        heightSpace,
        Text(
          'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, sed do\neiusmod tempor',
          textAlign: TextAlign.center,
          style: white13RegularTextStyle,
        ),
      ],
    );
  }

  page2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Image.asset(
          'assets/powerlifting.png',
          height: 180,
          width: 260,
          fit: BoxFit.cover,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'POWERLIFTING',
          style: white20SemiBoldTextStyle,
        ),
        heightSpace,
        Text(
          'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, sed do\neiusmod tempor',
          textAlign: TextAlign.center,
          style: white13RegularTextStyle,
        ),
      ],
    );
  }

  page3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Image.asset(
          'assets/yoga.png',
          height: 200,
          width: 250,
          fit: BoxFit.cover,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'YOGA',
          style: white20SemiBoldTextStyle,
        ),
        heightSpace,
        Text(
          'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, sed do\neiusmod tempor',
          textAlign: TextAlign.center,
          style: white13RegularTextStyle,
        ),
      ],
    );
  }
}
