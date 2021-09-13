import 'package:dynamic_grade_average_c4/helper/data_helper.dart';
import 'package:dynamic_grade_average_c4/model/lessons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LessonList extends StatelessWidget {
  LessonList({required this.onDisMiss, Key? key}) : super(key: key);
  final Function onDisMiss;
  @override
  Widget build(BuildContext context) {
    List<Lessons> allLessons = DataHelper.allAddedLessons;

    return allLessons.length > 0
        ? ListView.builder(
            itemCount: allLessons.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onDisMiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    child: ListTile(
                      title: Text(allLessons[index].name),
                      leading: CircleAvatar(
                        backgroundColor: Color(0xff501E4B),
                        child: Text(
                          (allLessons[index].letterValue *
                                  allLessons[index].creditValue)
                              .toStringAsFixed(0),
                        ),
                      ),
                      subtitle: Text(
                          "${allLessons[index].creditValue} Credit, Grade Value ${allLessons[index].letterValue}"),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Pleas Add Lesson",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff501E4B),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
