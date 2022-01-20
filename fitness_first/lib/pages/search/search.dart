import 'package:fitness_first/pages/screens.dart';
import 'package:fitness_first/widget/column_builder.dart';

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final recentSearchList = [
    {'search': 'Full body workout'},
    {'search': 'Push ups'},
    {'search': 'Yoga exercise'},
    {'search': 'Yoga trainer'},
  ];

  final suggestionList = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          searchTextField(),
          recentSearch(),
          suggestion(),
        ],
      ),
    );
  }

  searchTextField() {
    return Container(
      margin: const EdgeInsets.all(fixPadding * 2.0),
      decoration: BoxDecoration(
        color: const Color(0xfff5f5f5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        cursorColor: primaryColor,
        style: black14MediumTextStyle,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.only(top: 12),
          hintText: 'Search for workout or trainer',
          hintStyle: grey13RegularTextStyle,
          prefixIcon: const Icon(
            Icons.search,
            color: greyColor,
          ),
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  recentSearch() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        0,
        fixPadding * 2.0,
        fixPadding * 2.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Searches',
            style: black13MediumTextStyle,
          ),
          ColumnBuilder(
              itemCount: recentSearchList.length,
              itemBuilder: (context, index) {
                final item = recentSearchList[index];
                return Padding(
                  padding: const EdgeInsets.only(top: fixPadding * 1.2),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.history,
                        color: greyColor,
                        size: 18,
                      ),
                      widthSpace,
                      widthSpace,
                      Text(
                        item['search'],
                        style: grey13RegularTextStyle,
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }

  suggestion() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Suggestion for you',
            style: black16SemiBoldTextStyle,
          ),
          ColumnBuilder(
            itemCount: suggestionList.length,
            itemBuilder: (context, index) {
              final item = suggestionList[index];
              // ignore: prefer_if_null_operators
              var type = item['type'] == null ? '' : item['type'];
              return Padding(
                padding: const EdgeInsets.only(top: fixPadding * 2.0),
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
                                          '${item['trainingName']} Add To Favorite List.')
                                      : Text(
                                          '${item['trainingName']} Remove From Favorite List.'),
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
}
