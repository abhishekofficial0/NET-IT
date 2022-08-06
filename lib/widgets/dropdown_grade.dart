import 'package:flutter/material.dart';

class DropdownGrade extends StatefulWidget {
  @override
  _DropdownGradeState createState() => _DropdownGradeState();
}

bool rolevalidate = false;

class _DropdownGradeState extends State<DropdownGrade> {
  var currentSelectedValue;
  String role = '';
  final gradeTypes = [
    'Grade 1',
    'Grade 2',
    'Grade 3',
    'Grade 4',
  ];

  Widget typeFieldWidget() {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: const InputDecoration(
              //border: OutlineInputBorder(
              // borderRadius: BorderRadius.circular(5.0),
              //),
              ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: const Text(
                '  Grade',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xffBCBCBC),
                ),
              ),
              value: currentSelectedValue,
              isDense: true,
              onChanged: (newValue) {
                setState(
                  () {
                    currentSelectedValue = newValue;
                    currentSelectedValue.isEmpty
                        ? rolevalidate = false
                        : rolevalidate = true;
                  },
                );
                print(currentSelectedValue);
                role = currentSelectedValue;
              },
              menuMaxHeight: 200,
              items: gradeTypes.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return typeFieldWidget();
  }
}
