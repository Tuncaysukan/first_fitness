import 'package:fitness_first/pages/screens.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({Key key}) : super(key: key);

  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  final workoutList = [
    {
      'image': 'assets/workout/workout1.png',
      'trainingName': 'Weight Loss Training',
      'type': 'Full body workout',
      'time': '9 Min',
      'level': '9',
    },
    {
      'image': 'assets/workout/workout12.png',
      'trainingName': 'Arm Workout',
      'time': '9 Min',
      'level': '9',
    },
  ];

  final tipsList = [
    {
      'image': 'assets/tips/tip1.png',
      'title': 'Be Active',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad.',
    },
    {
      'image': 'assets/tips/tip2.png',
      'title': 'Avoid harmful use of alcohol',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            'Favorite List',
            style: black18SemiBoldTextStyle,
          ),
          bottom: const TabBar(
            indicatorWeight: 3,
            indicatorColor: primaryColor,
            padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            unselectedLabelColor: greyColor,
            labelColor: primaryColor,
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
            ),
            tabs: <Widget>[
              Tab(
                text: 'Workout',
              ),
              Tab(
                text: 'Health Tips',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            workoutList.isEmpty ? workoutListEmpty() : workouts(),
            tipsList.isEmpty ? healthTipListEmpty() : tips(),
          ],
        ),
      ),
    );
  }

  workoutListEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.favorite_border,
          color: greyColor,
          size: 30,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Favorite workout list is empty',
          style: grey15SemiBoldTextStyle,
        ),
      ],
    );
  }

  workouts() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: workoutList.length,
      itemBuilder: (context, index) {
        final item = workoutList[index];
        // ignore: prefer_if_null_operators
        var type = item['type'] == null ? '' : item['type'];
        return Slidable(
          actionPane: const SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: [
            Padding(
              padding: const EdgeInsets.only(top: fixPadding * 3.0),
              child: IconSlideAction(
                caption: 'Delete',
                color: primaryColor,
                icon: Icons.delete,
                foregroundColor: whiteColor,
                onTap: () {
                  setState(() {
                    workoutList.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Item Remove From Favorite List.'),
                  ));
                },
              ),
            ),
          ],
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              fixPadding * 2.0,
              fixPadding * 3.0,
              fixPadding * 2.0,
              0,
            ),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorkoutDetail(
                    image: item['image'],
                    trainingName: item['trainingName'],
                    type: type,
                    time: item['time'],
                    level: item['level'],
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.16,
                    padding: const EdgeInsets.only(
                      top: fixPadding,
                      left: fixPadding,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['trainingName'],
                          style: black14MediumTextStyle,
                        ),
                        item['type'] == null ? Container() : heightSpace,
                        item['type'] == null
                            ? Container()
                            : Text(
                                item['type'],
                                style: black13RegularTextStyle,
                              ),
                        heightSpace,
                        Text(
                          '${item['time']} - ${item['level']} level',
                          style: black13SemiBoldTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      item['image'],
                      height: 100,
                      width: 190,
                      fit: BoxFit.cover,
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

  healthTipListEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.favorite_border,
          color: greyColor,
          size: 30,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Favorite health tips list is empty',
          style: grey15SemiBoldTextStyle,
        ),
      ],
    );
  }

  tips() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: tipsList.length,
      itemBuilder: (context, index) {
        final item = tipsList[index];
        return Slidable(
          actionPane: const SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: [
            Padding(
              padding: const EdgeInsets.only(top: fixPadding * 3.0),
              child: IconSlideAction(
                caption: 'Delete',
                color: primaryColor,
                icon: Icons.delete,
                foregroundColor: whiteColor,
                onTap: () {
                  setState(() {
                    tipsList.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Item Remove From Favorite List.'),
                  ));
                },
              ),
            ),
          ],
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              fixPadding * 2.0,
              fixPadding * 2.5,
              fixPadding * 2.0,
              0,
            ),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HealthTipDetails(
                    tag: tipsList[index],
                    image: item['image'],
                    tip: item['title'],
                  ),
                ),
              ),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      Hero(
                        tag: tipsList[index],
                        child: Image.asset(
                          item['image'],
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.13,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(fixPadding / 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              style: black15SemiBoldTextStyle,
                            ),
                            heightSpace,
                            Text(
                              item['description'],
                              style: grey13RegularTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
