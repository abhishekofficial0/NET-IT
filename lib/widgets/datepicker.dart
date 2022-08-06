import 'package:flutter/material.dart';

class Datepicker extends StatefulWidget {
  @override
  _DatepickerState createState() => _DatepickerState();
}

bool dobvalidate = false;

class _DatepickerState extends State<Datepicker> {
  DateTime? date;
  String dob = '';

  String getText() {
    if (date == null) {
      dobvalidate = false;
      print(dobvalidate);
      return 'Choose date from Calendar';
    } else {
      dobvalidate = true;
      print(dobvalidate);
      return '${date!.day}.${date!.month}.${date!.year}';
    }
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newdate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 40),
      lastDate: DateTime(DateTime.now().year + 10),
      builder: (context, child) {
        return Column(
          children: <Widget>[
            Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light().copyWith(
                  primary: Color(0xff6169BB),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  height: 500,
                  width: 500,
                  child: child,
                ),
              ),
            ),
          ],
        );
      },
    );

    if (newdate == null) return;

    setState(() {
      date = newdate;
      dob = '${date!.day}.${date!.month}.${date!.year}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: 60,
        //width: 320,
         decoration: BoxDecoration(
        //  color: Colors.white,
         borderRadius: BorderRadius.circular(10),
        // border: Border.all(width: 1.0, color: Colors.grey),
         ),
        child: ElevatedButton(
          onPressed: () => pickDate(context),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            elevation: 0,
          ),
          child: Row(
            children: <Widget>[
              if (date == null)
                Text(
                  getText(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                  //  TextStyle(
                  //   color: Colors.grey[700],
                  //   fontWeight: FontWeight.w400,
                  //   fontSize: 16,
                  // ),
                  textAlign: TextAlign.left,
                ),
              if (date != null)
                Text(getText(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
              SizedBox(width: 6),
              Spacer(),
              Icon(Icons.arrow_drop_down, color: Colors.grey[700]),
            ],
          ),
        ),
      ),
    );
  }
}
