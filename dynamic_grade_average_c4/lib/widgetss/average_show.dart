import 'package:dynamic_grade_average_c4/constans/constans_c4.dart';
import 'package:flutter/material.dart';

class AverageShow extends StatelessWidget {
  const AverageShow(
      {required this.average, required this.numberOfLessons, Key? key})
      : super(key: key);
  final double average;
  final int numberOfLessons;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          numberOfLessons > 0
              ? "$numberOfLessons Lesson Entered"
              : "Choose Lesson",
          style: ConstanApp.numberLessonsStyle,
        ),
        Text(
          average >= 0 ? "${average.toStringAsFixed(2)}" : "0.0",
          style: ConstanApp.averageShowStyle,
        ),
        Text(
          "Average",
          style: ConstanApp.numberLessonsStyle,
        ),
      ],
    );
  }
}
