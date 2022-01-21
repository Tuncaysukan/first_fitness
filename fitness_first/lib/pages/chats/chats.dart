import 'package:fitness_first/pages/screens.dart';

class Chats extends StatelessWidget {
  Chats({Key key}) : super(key: key);

  final chatList = [
    {
      'image': 'assets/trainer/trainer1.png',
      'name': 'Shilpa Patel',
      'message': 'Lorem ipsum dolor sit amet.',
      'time': '11:40 am',
    },
    {
      'image': 'assets/users/user1.png',
      'name': 'Tiya Taylor',
      'message': 'Lorem ipsum dolor sit amet.',
      'time': '1 day ago',
    },
    {
      'image': 'assets/users/user2.png',
      'name': 'Fitne Fücur  ',
      'message': 'İşi Gücü Fitne.',
      'time': '1 day ago',
    },
    {
      'image': 'assets/users/user3.png',
      'name': 'Suzein Smith',
      'message': 'Lorem ipsum dolor sit amet.',
      'time': '2 day ago',
    },
    {
      'image': 'assets/users/user4.png',
      'name': 'Amenda Doe',
      'message': 'Lorem ipsum dolor sit amet.',
      'time': '3 day ago',
    },
    {
      'image': 'assets/users/user5.png',
      'name': 'Zobol  Taha ',
      'message': 'Lorem ipsum dolor sit amet.',
      'time': '3 day ago',
    },
    {
      'image': 'assets/users/user6.png',
      'name': 'Yusuf BELGE ',
      'message': 'Lorem ipsum dolor sit amet.',
      'time': '3 day ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Mesajlar',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: chat(),
    );
  }

  chat() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        final item = chatList[index];
        return Column(
          children: [
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Message(
                    name: item['name'],
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
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
                        widthSpace,
                        widthSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    item['time'],
                                    style: black13MediumTextStyle,
                                  ),
                                ],
                              ),
                              Text(
                                item['name'],
                                style: black18MediumTextStyle,
                              ),
                              Text(
                                item['message'],
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
