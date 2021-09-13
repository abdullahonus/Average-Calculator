import 'package:dynamic_grade_average_c4/constans/constans_c4.dart';
import 'package:dynamic_grade_average_c4/helper/data_helper.dart';
import 'package:dynamic_grade_average_c4/model/lessons.dart';
import 'package:dynamic_grade_average_c4/widgetss/average_show.dart';
import 'package:dynamic_grade_average_c4/widgetss/credit_dropdown_widget.dart';
import 'package:dynamic_grade_average_c4/widgetss/lesson_list.dart';
import 'package:dynamic_grade_average_c4/widgetss/letter_dropdown_widget.dart';
import 'package:flutter/material.dart';

class AverageGradeAppPage extends StatefulWidget {
  AverageGradeAppPage({Key? key}) : super(key: key);

  @override
  _AverageGradeAppPageState createState() => _AverageGradeAppPageState();
}

class _AverageGradeAppPageState extends State<AverageGradeAppPage> {
  var formKey = GlobalKey<FormState>();
  double selectedLetterValue = 4;
  double selectedCreditValue = 1;
  String enteredLessonName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        elevation: 0,
        backgroundColor: Color(0xff501E4B),
        title: Center(
          child: Text(
            ConstanApp.titleText,
            style: ConstanApp.titleStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 10,
          ),
          //form
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: AverageShow(
                  average: DataHelper.calculateAverage(),
                  numberOfLessons: DataHelper.allAddedLessons.length,
                ),
              ),
            ],
          ),

          SizedBox(height: 10),
          //liste
          Expanded(child: LessonList(
            onDisMiss: (index) {
              DataHelper.allAddedLessons.removeAt(index);
              setState(() {});
            },
          )),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 3,
            ),
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: LetterDropDownWidget(
                    onLetterChanged: (letter) {
                      selectedLetterValue = letter;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: CreditDropDownWidget(
                    onCreditChanged: (credit) {
                      selectedCreditValue = credit;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: _addLessonandCalculateAverage,
                icon: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Color(0xff501E4B),
                ),
                iconSize: 30,
              )
            ],
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          enteredLessonName = value!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return "Enter Lesson Name";
        } else
          return null;
      },
      decoration: InputDecoration(
          hintText: "History",
          hintStyle: TextStyle(fontSize: 15, color: Colors.black26),
          border: OutlineInputBorder(
              borderRadius: ConstanApp.borderRadius,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.grey.shade200),
    );
  }

  void _addLessonandCalculateAverage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var willAddLesson = Lessons(
          name: enteredLessonName,
          letterValue: selectedLetterValue,
          creditValue: selectedCreditValue);
      DataHelper.addLesson(willAddLesson);
      print(DataHelper.allAddedLessons);
      setState(() {});
    }
  }
}