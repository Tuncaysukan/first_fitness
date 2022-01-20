import 'package:fitness_first/pages/screens.dart';
import 'package:fitness_first/widget/column_builder.dart';

class PremiumPlans extends StatefulWidget {
  const PremiumPlans({Key key}) : super(key: key);

  @override
  _PremiumPlansState createState() => _PremiumPlansState();
}

class _PremiumPlansState extends State<PremiumPlans> {
  int isSelected = 1;

  final plansList = [
    {
      'name': 'Free Trial',
      'price': '\$0.0',
      'days': '7',
      'detail': 'Access all workout , all health tips and chat with trainer.',
    },
    {
      'name': 'Monthly',
      'price': '\$7.99',
      'days': '28',
      'detail': 'Access all workout , all health tips and chat with trainer.',
    },
    {
      'name': 'Annually',
      'price': '\$90.00',
      'days': '365',
      'detail': 'Access all workout , all health tips and chat with trainer.',
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
          'Premium Plans',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        children: [
          plans(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          payButton(),
        ],
      ),
    );
  }

  plans() {
    return ColumnBuilder(
      itemCount: plansList.length,
      itemBuilder: (context, index) {
        final item = plansList[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: fixPadding * 3.0),
          child: InkWell(
            onTap: () {
              setState(() {
                isSelected = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(fixPadding),
              decoration: BoxDecoration(
                color: isSelected == index ? Colors.transparent : whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: isSelected == index
                        ? primaryColor.withOpacity(0.1)
                        : blackColor.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                  ),
                ],
                image: isSelected == index
                    ? const DecorationImage(
                        image: AssetImage('assets/container_bg.png'),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['name'],
                        style: TextStyle(
                          color: isSelected == index ? whiteColor : blackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        item['price'],
                        style: TextStyle(
                          color: isSelected == index ? whiteColor : blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'For ${item['days']} days',
                    style: TextStyle(
                      color: isSelected == index ? whiteColor : blackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  heightSpace,
                  Text(
                    item['detail'],
                    style: TextStyle(
                      color: isSelected == index ? whiteColor : blackColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
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

  payButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => successDialog(),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: fixPadding * 5.0,
              vertical: fixPadding,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              'Pay',
              style: white18BoldTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  successDialog() {
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
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/done.png',
                        height: 60,
                        width: 60,
                      ),
                      heightSpace,
                      heightSpace,
                      Text(
                        'Successful',
                        style: black16SemiBoldTextStyle,
                      ),
                      heightSpace,
                      heightSpace,
                      Text(
                        'Lorem ipsum dolor sit amet\nconsectetur adipiscing',
                        textAlign: TextAlign.center,
                        style: grey13RegularTextStyle,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
