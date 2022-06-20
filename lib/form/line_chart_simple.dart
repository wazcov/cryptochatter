import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SimpleLineChart extends StatefulWidget {
  const SimpleLineChart({Key? key}) : super(key: key);

  @override
  _SimpleLineChartState createState() => _SimpleLineChartState();
}

class _SimpleLineChartState extends State<SimpleLineChart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
        width: screenWidth * .25,
        height: screenWidth * .30,
        child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                border: Border.all(color: Colors.black12, width: 2.0)),
            child: Column(
              children: <Widget>[
                Text("ETH"),
                Text("\$1"),
                 Container(
                    width: screenWidth * .125,
                    height: screenWidth * .15,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                        color: Color(0xffffffff)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 1, left: 1, top: 1, bottom: 1),
                      child: LineChart(
                        mainData(),
                      ),
                    ),
                  ),
              ],
            )));
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 6,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 6,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      backgroundColor: Theme.of(context).colorScheme.background,
      gridData: FlGridData(
          show: false,
          drawVerticalLine: false,
          drawHorizontalLine: false,
          horizontalInterval: 1,
          verticalInterval: 1
          // getDrawingHorizontalLine: (value) {
          //   return FlLine(
          //     color: const Color(0xff37434d),
          //     strokeWidth: .1,
          //   );
          // },
          // getDrawingVerticalLine: (value) {
          //   return FlLine(
          //     color: const Color(0xff37434d),
          //     strokeWidth: .1,
          //   );
          // },
          ),
      titlesData: FlTitlesData(
        show: false,
        // rightTitles: AxisTitles(
        //   sideTitles: SideTitles(showTitles: false),
        // ),
        // topTitles: AxisTitles(
        //   sideTitles: SideTitles(showTitles: false),
        // ),
        // bottomTitles: AxisTitles(
        //   sideTitles: SideTitles(
        //     showTitles: true,
        //     reservedSize: 15,
        //     interval: 1,
        //     getTitlesWidget: bottomTitleWidgets,
        //   ),
        // ),
        // leftTitles: AxisTitles(
        //   sideTitles: SideTitles(
        //     showTitles: true,
        //     interval: 1,
        //     getTitlesWidget: leftTitleWidgets,
        //     reservedSize: 21,
        //   ),
        // ),
      ),
      borderData: FlBorderData(
        show: false,
        // border: Border.all(color: const Color(0xff37434d), width: 1)
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: false,
          color: Colors.red,
          // gradient: LinearGradient(
          //   colors: gradientColors,
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          // ),
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: false,
            // gradient: LinearGradient(
            //   colors: gradientColors
            //       .map((color) => color.withOpacity(0.3))
            //       .toList(),
            //   begin: Alignment.centerLeft,
            //   end: Alignment.centerRight,
          ),
        )
      ],
    );
  }
}
