import 'package:fitness_first/pages/screens.dart';

class Rest extends StatelessWidget {
  const Rest({Key key}) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              children: [
                pageIndicator(),
                const SizedBox(height: 180),
                Text(
                  'Take a rest 00:30 sec',
                  style: black20SemiBoldTextStyle,
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                skipButton(context),
              ],
            ),
          ),
          nextExerciseDetail(),
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

  nextExerciseDetail() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        0,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Next',
            style: grey15SemiBoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '2. Barbell Back Squat',
                style: black16SemiBoldTextStyle,
              ),
              Text(
                '00:60',
                style: black16SemiBoldTextStyle,
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/workout/workout5.png',
              height: 90,
              width: 90,
            ),
          ),
        ],
      ),
    );
  }

  skipButton(context) {
    return InkWell(
      onTap: () => workoutCompletedDialog(context),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2.0,
          vertical: fixPadding / 2,
        ),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          'Skip',
          style: white15BoldTextStyle,
        ),
      ),
    );
  }

  workoutCompletedDialog(context) {
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
                padding: const EdgeInsets.all(fixPadding * 1.5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.close,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    heightSpace,
                    Text(
                      'Weight Loss Training',
                      style: black16SemiBoldTextStyle,
                    ),
                    heightSpace,
                    Text(
                      'Congratulations your today’s workout\ncompleted.',
                      textAlign: TextAlign.center,
                      style: grey13RegularTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Burn Calories',
                              style: grey14RegularTextStyle,
                            ),
                            Text(
                              '568 Cal',
                              style: black15SemiBoldTextStyle,
                            ),
                          ],
                        ),
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        Column(
                          children: [
                            Text(
                              'Total Steps',
                              style: grey14RegularTextStyle,
                            ),
                            Text(
                              '2,123',
                              style: black15SemiBoldTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(fixPadding),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          border: Border.all(color: primaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Share to Friends',
                          style: white18BoldTextStyle,
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(fixPadding),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: primaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Not Now',
                          style: primaryColor18BoldTextStyle,
                        ),
                      ),
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
