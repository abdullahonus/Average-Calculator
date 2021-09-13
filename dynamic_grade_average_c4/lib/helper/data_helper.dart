import 'package:dynamic_grade_average_c4/model/lessons.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<Lessons> allAddedLessons = [];
  static addLesson(Lessons lessons) {
    allAddedLessons.add(lessons);
  }

  static List<String> _allGradesLatters() {
    return ['AA', "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double _changeLetterToGrade(String latter) {
    switch (latter) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "CB":
        return 2.5;
      case "CC":
        return 2.0;
      case "DC":
        return 1.5;
      case "DD":
        return 1;
      case "FD":
        return 0.5;
      case "FF":
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allLessonsLetters() {
    return _allGradesLatters()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e),
            value: _changeLetterToGrade(e),
          ),
        )
        .toList();
  }

  static List<int> _allcredits() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allCreditsforLessons() {
    return _allcredits()
        .map(
          (e) => DropdownMenuItem(
            child: Text(
              e.toString(),
            ),
            value: e.toDouble(),
          ),
        )
        .toList();
  }

  static double calculateAverage() {
    double totalGrade = 0;
    double totalCredit = 0;

    allAddedLessons.forEach((element) {
      totalGrade = totalGrade + (element.creditValue * element.letterValue);
      totalCredit += element.creditValue;
    });
    return totalGrade / totalCredit;
  }
}
