import 'package:fitness_first/pages/screens.dart';
import 'package:fitness_first/widget/column_builder.dart';

class WorkoutDetail extends StatefulWidget {
  final String image;
  final String trainingName;
  final String type;
  final String time;
  final String level;
  const WorkoutDetail(
      {Key key,
      this.image,
      this.trainingName,
      this.type,
      this.time,
      this.level})
      : super(key: key);

  @override
  _WorkoutDetailState createState() => _WorkoutDetailState();
}

class _WorkoutDetailState extends State<WorkoutDetail> {
  double height;
  double width;
  bool isFavorite = false;

  final stepsList = [
    {
      'image': 'assets/workout/workout4.png',
      'exerciseName': 'Barbell Bench Press',
      'burnCalories': '6',
      'time': '1 Min',
    },
    {
      'image': 'assets/workout/workout5.png',
      'exerciseName': 'Barbell Back Squat',
      'burnCalories': '6',
      'time': '1 Min',
    },
    {
      'image': 'assets/workout/workout6.png',
      'exerciseName': 'Pull-Ups',
      'burnCalories': '6',
      'time': '1 Min',
    },
    {
      'image': 'assets/workout/workout2.png',
      'exerciseName': 'Lying Dumbbell Hamstring Curls',
      'burnCalories': '6',
      'time': '1 Min',
    },
    {
      'image': 'assets/workout/workout7.png',
      'exerciseName': 'Standing Overhead Press',
      'burnCalories': '6',
      'time': '1 Min',
    },
    {
      'image': 'assets/workout/workout8.png',
      'exerciseName': 'Face Pulls',
      'burnCalories': '6',
      'time': '1 Min',
    },
    {
      'image': 'assets/workout/workout9.png',
      'exerciseName': 'Drag Curls',
      'burnCalories': '6',
      'time': '1 Min',
    },
    {
      'image': 'assets/workout/workout10.png',
      'exerciseName': 'Jumping Jacks',
      'burnCalories': '6',
      'time': '1 Min',
    },
    {
      'image': 'assets/workout/workout11.png',
      'exerciseName': 'Soulder Rotation',
      'burnCalories': '6',
      'time': '1 Min',
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.share_outlined),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.16,
                padding: const EdgeInsets.only(left: fixPadding * 2.0),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
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
                      widget.trainingName,
                      style: black14MediumTextStyle,
                    ),
                    widget.type == '' ? Container() : heightSpace,
                    widget.type == ''
                        ? Container()
                        : Text(
                            widget.type,
                            style: black13RegularTextStyle,
                          ),
                    heightSpace,
                    Text(
                      '${widget.time} - ${widget.level} level',
                      style: black13SemiBoldTextStyle,
                    ),
                    heightSpace,
                    InkWell(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: isFavorite
                              ? Text(
                                  '${widget.trainingName} Add To Favorite List.')
                              : Text(
                                  '${widget.trainingName} Remove From Favorite List.'),
                        ));
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_outline,
                        size: 22.0,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  widget.image,
                  height: 100,
                  width: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          heightSpace,
          aboutExercise(),
          divider(),
          steps(),
        ],
      ),
    );
  }

  aboutExercise() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding * 1.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '9 Exercise • 9 Minutes • 54 Calories • Beginner',
            style: black13MediumTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing el elit, sed do eiusmod tempor incididunt ut labore et di dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut.',
            style: grey13RegularTextStyle,
          ),
        ],
      ),
    );
  }

  steps() {
    return ColumnBuilder(
      itemCount: stepsList.length,
      itemBuilder: (context, index) {
        final item = stepsList[index];
        return Padding(
          padding: const EdgeInsets.only(
            top: fixPadding * 2.0,
            left: fixPadding * 2.0,
            right: fixPadding * 2.0,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExerciseSteps(
                    image: item['image'],
                    step: '${index + 1}',
                    exerciseName: item['exerciseName'],
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 2.0),
                    color: blackColor.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    item['image'],
                    height: height * 0.12,
                    width: width * 0.2,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            0,
                            fixPadding / 2,
                            fixPadding,
                            8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Step : ${index + 1}',
                                style: black10BoldTextStyle,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          item['exerciseName'],
                          style: black13MediumTextStyle,
                        ),
                        const SizedBox(height: 3.0),
                        Text(
                          'Burns : ${item['burnCalories']}',
                          style: grey12RegularTextStyle,
                        ),
                        const SizedBox(height: 3.0),
                        Text(
                          'Time : ${item['time']}',
                          style: grey12RegularTextStyle,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: const EdgeInsets.all(fixPadding / 2),
                            decoration: const BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  divider() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: fixPadding * 2.0),
          color: primaryColor,
          height: 3,
          width: 90,
        ),
      ],
    );
  }
}
