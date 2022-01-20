import 'package:fitness_first/pages/screens.dart';

class MyTrainer extends StatelessWidget {
  MyTrainer({Key key}) : super(key: key);

  final trainerList = [
    {
      'image': 'assets/trainer/trainer1.png',
      'name': 'Shilpa Patel',
      'type': 'Yoga Trainer',
    },
    {
      'image': 'assets/users/user2.png',
      'name': 'Peter Johnson',
      'type': 'Fitness Trainer',
    },
    {
      'image': 'assets/users/user3.png',
      'name': 'Suzein Smith',
      'type': 'Fitness Trainer',
    },
    {
      'image': 'assets/users/user1.png',
      'name': 'Tiya Taylor',
      'type': 'Yoga Trainer',
    },
    {
      'image': 'assets/users/user5.png',
      'name': 'Russeil Taylor',
      'type': 'Muscle Trainer',
    },
    {
      'image': 'assets/users/user4.png',
      'name': 'Amenda Doe',
      'type': 'Fitness Trainer',
    },
    {
      'image': 'assets/users/user6.png',
      'name': 'John Doe',
      'type': 'Muscle Trainer',
    },
  ];

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
          'My Trainer',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: trainer(),
    );
  }

  trainer() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: trainerList.length,
      itemBuilder: (context, index) {
        final item = trainerList[index];
        return Column(
          children: [
            InkWell(
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
              child: Padding(
                padding: const EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Hero(
                          tag: trainerList[index],
                          child: Container(
                            height: 60,
                            width: 60,
                            margin: const EdgeInsets.all(1.5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(item['image']),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: blackColor.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        widthSpace,
                        widthSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: black18MediumTextStyle,
                              ),
                              Text(
                                item['type'],
                                style: grey13RegularTextStyle,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            divider(),
          ],
        );
      },
    );
  }

  divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Container(
        color: greyColor,
        height: 1,
        width: double.infinity,
      ),
    );
  }
}
