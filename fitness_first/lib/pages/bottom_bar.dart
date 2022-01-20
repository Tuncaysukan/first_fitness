import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:fitness_first/pages/screens.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

int currentIndex = 0;

class _BottomBarState extends State<BottomBar> {
  DateTime currentBackPressTime;

  changeIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
        child: (currentIndex == 0)
            ? const Home()
            : (currentIndex == 1)
                ? const HealthTips()
                : (currentIndex == 2)
                    ? const MyActivity()
                    : (currentIndex == 3)
                        ? Chats()
                        : const Profile(),
      ),
      bottomNavigationBar: Container(
        height: 80.0,
        alignment: Alignment.center,
        child: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getBottomBarItemTile(0, 'assets/icons/workout.png', 'Antreman'),
              getBottomBarItemTile(1, 'assets/icons/health.png', 'Blog'),
              getBottomBarItemTile(2, 'assets/icons/activity.png', 'Rapor'),
              getBottomBarItemTile(3, 'assets/icons/chat.png', 'Sohbet'),
              getBottomBarItemTile(4, 'assets/icons/profile.png', 'Profil'),
            ],
          ),
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

  getBottomBarItemTile(int index, String icon, String title) {
    return InkWell(
      focusColor: primaryColor,
      onTap: () {
        changeIndex(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              icon,
              height: 25,
              width: 25,
              color: (currentIndex == index) ? primaryColor : greyColor,
            ),
          ),
          heightSpace,
          Text(
            title.toUpperCase(),
            style: TextStyle(
              color: (currentIndex == index) ? primaryColor : greyColor,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
