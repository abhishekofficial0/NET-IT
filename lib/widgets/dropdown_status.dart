import 'package:flutter/material.dart';

class DropdownStatus extends StatefulWidget {
  @override
  _DropdownStatusState createState() => _DropdownStatusState();
}

bool rolevalidate = false;

class _DropdownStatusState extends State<DropdownStatus> {
  var currentSelectedValue;
  String role = '';
  final gradeTypes = [
    'To Do',
    'In Progress',
    'Incomplete',
    'Complete',
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
                '  Status',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
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
