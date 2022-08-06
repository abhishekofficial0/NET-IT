import 'package:flutter/material.dart';
import 'package:net_it/screens/totalmemberscreen.dart';

class DropdownRole extends StatefulWidget {
  @override
  _DropdownRoleState createState() => _DropdownRoleState();
}

bool rolevalidate = false;

class _DropdownRoleState extends State<DropdownRole> {
  var currentSelectedValue;
  String role = '';
  final deviceTypes = [
    "Media",
    "Accounts",
    "Developer",
    "Designer",
    "Team Leader"
  ];

  Widget typeFieldWidget() {
    return Container(
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Text(
                  "Choose Role from the below",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w300),
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
                items: deviceTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return typeFieldWidget();
  }
}
