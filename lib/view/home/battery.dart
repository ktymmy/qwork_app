//バッテリーの表示
import 'package:flutter/material.dart';
import '../../const/color.dart';

class Battery extends StatefulWidget {
  const Battery({super.key});

  @override
  State<Battery> createState() => BatteryState();
}

class BatteryState extends State<Battery> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // 重ねる位置を指定
      children: [
        Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: HomeColor.batteryimgbk),
          child: Image.asset('images/battery.png'),
        ),
        Container(
          height: 130,
          width: 130,
          child: const CircularProgressIndicator(
            value: 0.75,
            backgroundColor: HomeColor.batterybk,
            color: HomeColor.battery,
            strokeWidth: 10.0,
            semanticsLabel: "Circular progress indicator",
          ),
        ),
      ],
    );
  }
}
