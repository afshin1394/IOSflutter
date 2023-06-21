import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Home extends StatelessWidget {
  final List<ChartData> chartData = [
    ChartData('David', 25, Color.fromRGBO(9, 0, 136, 1)),
    ChartData('Steve', 38, Color.fromRGBO(147, 0, 119, 1)),
    ChartData('Jack', 34, Color.fromRGBO(228, 0, 124, 1)),
    ChartData('Others', 52, Color.fromRGBO(255, 189, 57, 1))
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/profile.png',
            height: MediaQuery.of(context).size.height * 0.20,
            width: 350.0,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
            width: 50,
          ),
          const Text('Welcome',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
              )),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.label, this.value, this.color);
  final String label;
  final double value;
  final Color color;
}
