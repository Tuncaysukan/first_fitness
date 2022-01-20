import 'package:fitness_first/pages/screens.dart';

class ExerciseSteps extends StatelessWidget {
  final String image;
  final String step;
  final String exerciseName;
  const ExerciseSteps(
      {Key key,
      this.image = 'assets/workout/workout4.png',
      this.exerciseName = 'Barbell Bench Press',
      this.step = '1'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        children: [
          Image.asset(
            image,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Container(
            padding: const EdgeInsets.all(fixPadding),
            alignment: Alignment.center,
            color: primaryColor,
            child: Text(
              '$step. $exerciseName',
              style: white14MediumTextStyle,
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          aboutExercise(),
        ],
      ),
      bottomNavigationBar: startNowButton(context),
    );
  }

  aboutExercise() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '1.  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
            style: grey13RegularTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            '2.  Lorem ipsum dolor sit amet, consectetur adipiscini adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.',
            style: grey13RegularTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Align(
            alignment: Alignment.center,
            child: Text(
              '$step / 9',
              style: black16ExtraBoldTextStyle,
            ),
          )
        ],
      ),
    );
  }

  startNowButton(context) {
    return InkWell(
      onTap: () => readyDialog(context),
      child: Container(
        height: 50,
        margin: const EdgeInsets.all(fixPadding * 2.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          'Start Now',
          style: white18BoldTextStyle,
        ),
      ),
    );
  }

  readyDialog(context) {
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
                    Text(
                      'Are you Ready?',
                      style: black16SemiBoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    Text(
                      'Are you excited to start workout feel the energy inside you, focus on your thoday’s goal, visiulise your dream body ads lets start',
                      textAlign: TextAlign.center,
                      style: grey13RegularTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ExerciseStart()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(fixPadding),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          border: Border.all(color: primaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Yes, I\'m Ready',
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
                          'No Hold On',
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
