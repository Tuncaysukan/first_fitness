import 'package:fitness_first/pages/screens.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ExerciseStart extends StatelessWidget {
  const ExerciseStart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          pageIndicator(),
          exerciseDetail(context),
          bottomAppBar(context),
        ],
      ),
    );
  }

  pageIndicator() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        0,
        fixPadding * 2.0,
        fixPadding * 4.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xffdbdbdb),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Container(
                    width: 25,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          widthSpace,
          Expanded(
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xffdbdbdb),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          widthSpace,
          Expanded(
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xffdbdbdb),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          widthSpace,
          Expanded(
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xffdbdbdb),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          widthSpace,
          Expanded(
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xffdbdbdb),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          widthSpace,
          Expanded(
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xffdbdbdb),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          widthSpace,
          Expanded(
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xffdbdbdb),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          widthSpace,
          Expanded(
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xffdbdbdb),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          widthSpace,
          Expanded(
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xffdbdbdb),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  exerciseDetail(context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/workout/workout4.png',
            height: MediaQuery.of(context).size.height * 0.32,
          ),
          Column(
            children: [
              CircularPercentIndicator(
                radius: 110.0,
                lineWidth: 9.0,
                percent: 0.22,
                progressColor: primaryColor,
                backgroundColor: greyColor.withOpacity(0.3),
                center: Text(
                  "00:22",
                  style: primaryColor25SemiBoldTextStyle,
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                'Barbell Bench Press',
                textAlign: TextAlign.center,
                style: black15MediumTextStyle,
              ),
              heightSpace,
              Text(
                'Next: Barbell Back Squat',
                textAlign: TextAlign.center,
                style: grey13RegularTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  bottomAppBar(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding,
        fixPadding * 2.0,
        fixPadding * 2.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Rest()),
            ),
            child: Container(
              alignment: Alignment.center,
              child: const Icon(
                Icons.play_circle,
                color: primaryColor,
                size: 50,
              ),
            ),
          ),
          const SizedBox(width: 130),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Rest()),
            ),
            child: const Icon(
              Icons.arrow_forward,
            ),
          ),
        ],
      ),
    );
  }
}
