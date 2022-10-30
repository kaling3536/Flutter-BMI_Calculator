import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class ScoreScreen extends StatelessWidget {
  final double bmiScore;

  final int age;

  String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor;

  ScoreScreen({Key? key, required this.bmiScore, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI 測試結果"),
      ),
      body: Container(
          padding: const EdgeInsets.all(0),
          child: Card(
              elevation: 12,
              shape: const RoundedRectangleBorder(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "你的BMI為",
                      style: TextStyle(fontSize: 30, color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrettyGauge(
                      gaugeSize: 300,
                      minValue: 0,
                      maxValue: 40,
                      segments: [
                        GaugeSegment('過輕', 18.5, Colors.red),
                        GaugeSegment('正常', 6.4, Colors.green),
                        GaugeSegment('過重', 5, Colors.orange),
                        GaugeSegment('肥胖', 10.1, Colors.pink),
                      ],
                      valueWidget: Text(
                        bmiScore.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 40),
                      ),
                      currentValue: bmiScore.toDouble(),
                      needleColor: Colors.blue,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiStatus!,
                      style: TextStyle(fontSize: 20, color: bmiStatusColor!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiInterpretation!,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("重新計算")),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  ]))),
    );
  }

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = "肥胖";
      bmiInterpretation = "請努力減肥，注意身體健康";
      bmiStatusColor = Colors.pink;
    } else if (bmiScore >= 25) {
      bmiStatus = "過重";
      bmiInterpretation = "稍微鍛鍊一下，減輕體重";
      bmiStatusColor = Colors.orange;
    } else if (bmiScore >= 18.5) {
      bmiStatus = "正常";
      bmiInterpretation = "真棒!請繼續保持";
      bmiStatusColor = Colors.green;
    } else if (bmiScore < 18.5) {
      bmiStatus = "過輕";
      bmiInterpretation = "太輕了，多吃一點吧";
      bmiStatusColor = Colors.red;
    }
  }
}
