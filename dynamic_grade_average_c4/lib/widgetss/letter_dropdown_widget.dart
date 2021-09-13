import 'package:dynamic_grade_average_c4/constans/constans_c4.dart';
import 'package:dynamic_grade_average_c4/helper/data_helper.dart';
import 'package:flutter/material.dart';

class LetterDropDownWidget extends StatefulWidget {
  LetterDropDownWidget({Key? key, required this.onLetterChanged})
      : super(key: key);
  final Function onLetterChanged;
  @override
  _LetterDropDownWidgetState createState() => _LetterDropDownWidgetState();
}

class _LetterDropDownWidgetState extends State<LetterDropDownWidget> {
  double selectedLetterValue = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: ConstanApp.DropDownPadding,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton<double>(
          elevation: 6,
          iconEnabledColor: Color(0xff501E4B),
          value: selectedLetterValue,
          onChanged: (value) {
            setState(() {
              selectedLetterValue = value!;
              widget.onLetterChanged(selectedLetterValue);
            });
          },
          underline: Container(),
          items: DataHelper.allLessonsLetters()),
    );
  }
}
