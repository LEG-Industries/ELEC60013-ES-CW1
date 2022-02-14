import 'package:flutter/material.dart';
import 'package:leg_barkr_app/model/steps_series.dart';
import 'package:leg_barkr_app/service/steps_service.dart';
import 'package:leg_barkr_app/view/steps/steps_chart.dart';
import 'package:leg_barkr_app/view/steps/steps_today.dart';

class StepsPage extends StatefulWidget {
  const StepsPage({ Key? key }) : super(key: key);

  @override
  _StepsPageState createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
  // Dummy metrics
  final List<StepsSeries> data = [
    StepsSeries(DateTime.utc(2022, 2, 9), 9867),
    StepsSeries(DateTime.utc(2022, 2, 8), 8123),
    StepsSeries(DateTime.utc(2022, 2, 7), 10234),
    StepsSeries(DateTime.utc(2022, 2, 6), 6521),
    StepsSeries(DateTime.utc(2022, 2, 5), 1021),
    StepsSeries(DateTime.utc(2022, 2, 4), 10567),
    StepsSeries(DateTime.utc(2022, 2, 3), 7500)
  ];


  Future<int> onStepsRetrieved() async{
      return await StepsService().getStepsToday("132-567-001");
  }


  @override
  Widget build(BuildContext context) {
    onStepsRetrieved();
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 50.0, 10.0, 0.0),
      child: FutureBuilder(
        future: onStepsRetrieved(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StepsToday(snapshot.data),
                new Expanded(child: StepsChart(data))
              ],
            );
        },
      )
    );
  }
}