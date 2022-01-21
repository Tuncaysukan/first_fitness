import 'package:fitness_first/pages/screens.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:pie_chart/pie_chart.dart' as chart;
import 'package:intl/intl.dart';

class MyActivity extends StatefulWidget {
  const MyActivity({Key key}) : super(key: key);

  @override
  State<MyActivity> createState() => _MyActivityState();
}

class _MyActivityState extends State<MyActivity> {
  double height;
  double width;
  var date = DateFormat('EE d MMM').format(DateTime.now());
  DateTime selectedDate = DateTime.now();

  Map<String, double> dataMap = {
    "Calories": 4,
    "Steps": 5,
    "Rest": 2,
  };

  List<Color> colorList = [
    primaryColor,
    const Color(0xff8f4024),
    const Color(0xffdbdbdb),
  ];

  var data = [1.0, 0.8, 0.5, 0.6, 0.3, 0.5, 0.4, 0.2, 0.3, 0.3, 0.2, 0.1];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Gelişim Süreci',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        children: [
          date == DateFormat('EE d MMM').format(DateTime.now())
              ? Text(
                  'Today',
                  style: black15SemiBoldTextStyle,
                )
              : Container(),
          InkWell(
            onTap: () async {
              final DateTime picked = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2021),
                lastDate: DateTime.now(),
              );
              if (picked != null && picked != selectedDate) {
                setState(() {
                  date = DateFormat('EE d MMM').format(picked);
                });
              }
            },
            child: Row(
              children: [
                Text(
                  date,
                  style: black15SemiBoldTextStyle,
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: blackColor,
                ),
              ],
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          pieChart(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          calories(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          weight(),
        ],
      ),
    );
  }

  calories() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding,
        vertical: fixPadding / 2,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              Text(
                'Daily Calorie Intake',
                style: black15SemiBoldTextStyle,
              ),
              Text(
                '1256 Cal',
                style: grey14MediumTextStyle,
              ),
            ],
          ),
          SizedBox(
            width: width * 0.3,
            height: height * 0.125,
            child: barchart(),
          ),
        ],
      ),
    );
  }

  weight() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding,
        vertical: fixPadding * 2.5,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Weight Record',
                style: black15SemiBoldTextStyle,
              ),
              Text(
                '52 kg',
                style: grey14MediumTextStyle,
              ),
            ],
          ),
          SizedBox(
            width: width * 0.4,
            height: height * 0.07,
            child: sparklineChart(),
          ),
        ],
      ),
    );
  }

  pieChart() {
    return Stack(
      children: [
        chart.PieChart(
          dataMap: dataMap,
          colorList: colorList,
          chartRadius: width * 0.4,
          ringStrokeWidth: 16,
          chartLegendSpacing: 40,
          initialAngleInDegree: 260,
          chartType: chart.ChartType.ring,
          legendOptions: chart.LegendOptions(
            showLegendsInRow: true,
            legendPosition: chart.LegendPosition.bottom,
            showLegends: true,
            legendTextStyle: black14MediumTextStyle,
          ),
          chartValuesOptions: const chart.ChartValuesOptions(
            showChartValues: false,
          ),
        ),
        Positioned(
          top: 50,
          left: 125,
          child: Column(
            children: [
              Text(
                'Active Calories',
                style: grey14RegularTextStyle,
              ),
              Text(
                '568 Cal',
                style: black15SemiBoldTextStyle,
              ),
              heightSpace,
              heightSpace,
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
        ),
      ],
    );
  }

  barchart() {
    return BarChart(
      BarChartData(
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                y: 14,
                width: 8,
                color: primaryColor,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  color: const Color(0xffdbdbdb),
                  y: 20,
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                y: 7,
                width: 8,
                color: primaryColor,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  color: const Color(0xffdbdbdb),
                  y: 20,
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                y: 9,
                width: 8,
                color: primaryColor,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  color: const Color(0xffdbdbdb),
                  y: 20,
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(
                y: 5,
                width: 8,
                color: primaryColor,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  color: const Color(0xffdbdbdb),
                  y: 20,
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 5,
            barRods: [
              BarChartRodData(
                y: 11,
                width: 8,
                color: primaryColor,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  color: const Color(0xffdbdbdb),
                  y: 20,
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 6,
            barRods: [
              BarChartRodData(
                y: 18,
                width: 8,
                color: primaryColor,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  color: const Color(0xffdbdbdb),
                  y: 20,
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 7,
            barRods: [
              BarChartRodData(
                y: 11,
                width: 8,
                color: primaryColor,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  color: const Color(0xffdbdbdb),
                  y: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  sparklineChart() {
    return Sparkline(
      data: data,
      lineColor: const Color(0xffdbdbdb),
      pointsMode: PointsMode.all,
      pointSize: 5.0,
      pointColor: primaryColor,
    );
  }
}
