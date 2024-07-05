import 'package:flutter/material.dart';
import 'package:qwork_app/const/color.dart';
import 'dart:math';
import './grid.dart';

class Radar extends StatefulWidget {
  const Radar({
    super.key,
  });

  @override
  State<Radar> createState() => _RadarState();
}

class _RadarState extends State<Radar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Map<String, num>> points = [
    {'fixedAngle': Random().nextDouble() * 2 * pi, 'radius': 1},
    {'fixedAngle': 1.0, 'radius': 7.5},
    {'fixedAngle': 1.0, 'radius': 3.5},
  ];

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: GridColor.gridbk,
          border: Border.all(
            color: GridColor.border,
            width: 6,
          ),
        ),
        child: CustomPaint(
          painter: Grid(
              points: points
                  .map((point) => point
                      .map((key, value) => MapEntry(key, value.toDouble())))
                  .toList()),
          size: Size(MediaQuery.of(context).size.width / 1.1,
              MediaQuery.of(context).size.width / 1.1),
        ),
      ),
    );
  }
}
