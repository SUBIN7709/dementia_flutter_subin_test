import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmentia_flutter_app/Home.dart';
import 'package:dmentia_flutter_app/servey/surveyStart.dart';
import 'package:dmentia_flutter_app/static/userInfo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class viewChart extends StatelessWidget {
  const viewChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LiveChart());
  }
}

class LiveChart extends StatefulWidget {
  const LiveChart({Key? key}) : super(key: key);

  @override
  _LiveChartState createState() => _LiveChartState();
}

class _LiveChartState extends State<LiveChart> {
  List<_ChartData> chartData = <_ChartData>[];

  @override
  initState() {
    getDataFromFireStore().then((results) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {});
      });
    });
    super.initState();
  }

  Future getDataFromFireStore() async {
    var snapShotsValue = await FirebaseFirestore.instance
        .collection("surveyResults")
        .where('user_id', isEqualTo: usersStaticInfo.userId)
        .orderBy('date')
        .get();
    List<_ChartData> list = snapShotsValue.docs
        .map((e) => _ChartData(
            // x: DateTime.parse(e.data()['date'].toString().substring(0, 10)),
            x: e.data()['date'],
            y: e.data()['MMSE']))
        .toList();

    setState(() {
      chartData = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showChart();
  }

  Widget _showChart() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'chart test',
        ),
        backgroundColor: Color.fromARGB(255, 176, 162, 39),
      ),
      body: chartData.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('아직 검사를 한번도 받지 않으셨어요 \n 검사를 받아보시겠어요?'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SurveyStart(),
                        ),
                      );
                    },
                    child: const Text('검사 하러 가기!'),
                  ),
                  Image.asset(
                    'images/dementia.png',
                    width: 90,
                    height: 90,
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${usersStaticInfo.userName}님의 기록이에요'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: SfCartesianChart(
                      tooltipBehavior: TooltipBehavior(enable: true),
                      primaryXAxis: DateTimeAxis(),
                      // series: <LineSeries<_ChartData, DateTime>>[
                      series: <LineSeries<_ChartData, Timestamp>>[
                        // LineSeries<_ChartData, DateTime>(
                        LineSeries<_ChartData, Timestamp>(
                          dataSource: chartData,
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 176, 162, 39)
                    ),
                    child: const Text(
                      'Go to Home',
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class _ChartData {
  _ChartData({this.x, this.y});
  //final DateTime? x;
  final Timestamp? x;
  final int? y;
}
