import 'dart:math';

class MenberModel {
  final String name;
  final int qid;
  final int? distance;
  final DateTime? startTime;
  DateTime? now = DateTime.now();
  final num radius;

  MenberModel({
    required this.name,
    required this.qid,
    this.distance,
    this.startTime,
    this.now,
    required this.radius,
  });
}

Map<String, num> points = {
  'fixedAngle': Random().nextDouble() * 2 * pi,
  'radius': 1,
};
