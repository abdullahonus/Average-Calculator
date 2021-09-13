import 'package:dynamic_grade_average_c4/constans/constans_c4.dart';
import 'package:dynamic_grade_average_c4/helper/data_helper.dart';
import 'package:flutter/material.dart';

class CreditDropDownWidget extends StatefulWidget {
  CreditDropDownWidget({required this.onCreditChanged, key}) : super(key: key);
  final Function onCreditChanged;
  @override
  _CreditDropDownWidgetState createState() => _CreditDropDownWidgetState();
}

class _CreditDropDownWidgetState extends State<CreditDropDownWidget> {
  double selectedCreditValue = 1;
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
          elevation: 15,
          iconEnabledColor: Color(0xff501E4B),
          value: selectedCreditValue,
          onChanged: (value) {
            setState(() {
              selectedCreditValue = value!;
              widget.onCreditChanged(selectedCreditValue);
            });
          },
          underline: Container(),
          items: DataHelper.allCreditsforLessons()),
    );
  }
}
