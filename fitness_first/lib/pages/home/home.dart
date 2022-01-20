import 'package:fitness_first/pages/screens.dart';
import 'package:fitness_first/widget/column_builder.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double height;
  double width;

  final workoutList = [
    {
      'image': 'assets/workout/workout1.png',
      'trainingName': 'Weight Loss Training',
      'type': 'Full body workout',
      'time': '9 Min',
      'level': '9',
      'isFavorite': false,
    },
    {
      'image': 'assets/workout/workout2.png',
      'trainingName': 'Muscle Building Training',
      'time': '11 Min',
      'level': '11',
      'isFavorite': false,
    },
    {
      'image': 'assets/workout/workout3.png',
      'trainingName': 'Back Workout Training',
      'time': '11 Min',
      'level': '11',
      'isFavorite': false,
    },
  ];

  final categoryList = [
    {
      'image': 'assets/category/category1.png',
      'category': 'Yoga',
      'color': const Color(0xffe3f2fd),
    },
    {
      'image': 'assets/category/category2.png',
      'category': 'Strength training',
      'color': const Color(0xffffebee),
    },
    {
      'image': 'assets/category/category3.png',
      'category': 'Balance  exercises',
      'color': const Color(0xffe8f5e9),
    },
    {
      'image': 'assets/category/category4.png',
      'category': 'Stretching',
      'color': const Color(0xffede7f6),
    },
  ];

  final trainerList = [
    {
      'image': 'assets/trainer/trainer1.png',
      'name': 'Shilpa Patel',
      'type': 'Yoga trainer',
      'color': const Color(0xffe3f2fd),
    },
    {
      'image': 'assets/trainer/trainer2.png',
      'name': 'Joie Patel',
      'type': 'Muscle trainer',
      'color': const Color(0xffffebee),
    },
    {
      'image': 'assets/trainer/trainer3.png',
      'name': 'Tish Shah',
      'type': 'Muscle trainer',
      'color': const Color(0xffe8f5e9),
    },
    {
      'image': 'assets/trainer/trainer1.png',
      'name': 'Shilpa Patel',
      'type': 'Yoga trainer',
      'color': const Color(0xffede7f6),
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Antreman',
          style: black18SemiBoldTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Search()),
            ),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          topWorkouts(),
          categories(),
          premiumBanner(),
          trainers(),
          heightSpace,
        ],
      ),
    );
  }

  topWorkouts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favori Antremanların',
            style: black16SemiBoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          ColumnBuilder(
            itemCount: workoutList.length,
            itemBuilder: (context, index) {
              final item = workoutList[index];
              // ignore: prefer_if_null_operators
              var type = item['type'] == null ? '' : item['type'];
              return Padding(
                padding: const EdgeInsets.only(bottom: fixPadding * 2.0),
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
                            heightSpace,
                            InkWell(
                              onTap: () {
                                setState(() {
                                  item['isFavorite'] = !item['isFavorite'];
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: item['isFavorite']
                                      ? Text(
                                          '${item['trainingName']} Favorilerime Ekle.')
                                      : Text(
                                          '${item['trainingName']} Favorilerden Sil'),
                                ));
                              },
                              child: Icon(
                                item['isFavorite']
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                size: 18,
                              ),
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
              );
            },
          ),
        ],
      ),
    );
  }

  categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'Kategoriler',
            style: black16SemiBoldTextStyle,
          ),
        ),
        heightSpace,
        heightSpace,
        SizedBox(
          height: height * 0.13,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              final item = categoryList[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  index == 0 ? fixPadding * 2.0 : 0,
                  0,
                  fixPadding * 1.5,
                  0,
                ),
                child: Container(
                  height: height * 0.13,
                  width: width * 0.22,
                  decoration: BoxDecoration(
                    color: item['color'],
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(item['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          item['category'],
                          textAlign: TextAlign.center,
                          style: black14SemiBoldTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  premiumBanner() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PremiumPlans()),
        ),
        child: Container(
          height: height * 0.14,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage('assets/premium_banner.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(
            'GO PREMIUM\nGET UNLIMITED ACCESS',
            textAlign: TextAlign.center,
            style: white16SemiBoldTextStyle,
          ),
        ),
      ),
    );
  }

  trainers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'Tercih Edilen Eğitmen',
            style: black16SemiBoldTextStyle,
          ),
        ),
        heightSpace,
        heightSpace,
        SizedBox(
          height: height * 0.14,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: trainerList.length,
            itemBuilder: (context, index) {
              final item = trainerList[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  index == 0 ? fixPadding * 2.0 : 0,
                  0,
                  fixPadding,
                  0,
                ),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopTrainer(
                        tag: trainerList[index],
                        image: item['image'],
                        name: item['name'],
                        type: item['type'],
                      ),
                    ),
                  ),
                  child: Card(
                    color: item['color'],
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipPath(
                      clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Hero(
                              tag: trainerList[index],
                              child: Image.asset(
                                item['image'],
                                height: height * 0.09,
                                width: width * 0.22,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: black12RegularTextStyle,
                                ),
                                Text(
                                  item['type'],
                                  style: black10RegularTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
