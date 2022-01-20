import 'package:fitness_first/pages/screens.dart';

class DailyGoal extends StatelessWidget {
  const DailyGoal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Goal',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        children: [
          loseWeight(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            'Daily Goal',
            style: black16SemiBoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          goal(),
        ],
      ),
    );
  }

  loseWeight() {
    return Container(
      padding: const EdgeInsets.all(fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2.0),
            color: blackColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lose Weight',
            style: black16MediumTextStyle,
          ),
          heightSpace,
          heightSpace,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '56 kg',
                    style: black14MediumTextStyle,
                  ),
                  Text(
                    'Current',
                    style: grey13RegularTextStyle,
                  )
                ],
              ),
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '50 kg',
                    style: black14MediumTextStyle,
                  ),
                  Text(
                    'Target',
                    style: grey13RegularTextStyle,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  goal() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.5,
            vertical: fixPadding / 2,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 2.0),
                color: blackColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/icons/calories.png',
                color: primaryColor,
                height: 35,
                width: 35,
              ),
              heightSpace,
              Text(
                '2,589',
                style: black16SemiBoldTextStyle,
              ),
              Text(
                'Calories',
                style: grey13RegularTextStyle,
              ),
            ],
          ),
        ),
        widthSpace,
        widthSpace,
        widthSpace,
        widthSpace,
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.5,
            vertical: fixPadding / 2,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 2.0),
                color: blackColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/icons/steps.png',
                height: 35,
                width: 35,
                color: primaryColor,
              ),
              heightSpace,
              Text(
                '3,589',
                style: black16SemiBoldTextStyle,
              ),
              Text(
                'Steps',
                style: grey13RegularTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
