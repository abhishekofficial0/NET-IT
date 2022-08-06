import 'package:flutter/material.dart';
import '../widgets/datepicker1.dart';
import '../widgets/dropdown_grade.dart';
//import '../models/user_task.dart';

class NewTaskForm extends StatefulWidget {
  static const routeName = 'new-task-form';
  const NewTaskForm({Key? key}) : super(key: key);

  @override
  State<NewTaskForm> createState() => _NewTaskFormState();
}

class _NewTaskFormState extends State<NewTaskForm> {
  final _descriptionfocusNode = FocusNode();
  final _attachmentsfocusNode = FocusNode();
  final _key = GlobalKey<FormState>();

  void dispose() {
    _descriptionfocusNode.dispose();
    _attachmentsfocusNode.dispose();
    super.dispose();
  }

  void _addTask() {
    _key.currentState!.save();
  }

  String selectedValue = "grade";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: MediaQuery.of(context).size.width * 0.05,
                  bottom: 20,
                ),
                child: const Text(
                  'CREATE TASK',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff545454),
                  ),
                ),
              ),
              Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05,
                        bottom: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffBCBCBC),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(prefixText: '   ',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                              bottom: 15,
                            ),
                            //prefixIcon: const Icon(Icons.home, color: Colors.white),
                            labelText: '  Title',
                            labelStyle: const TextStyle(
                              fontSize: 16,
                              color: Color(0xffBCBCBC),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_descriptionfocusNode);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05,
                        bottom: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffBCBCBC),
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              prefixText: '   ',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                bottom: 15,
                              ),

                              // prefixIcon: const Icon(Icons.home, color: Colors.white),
                              labelText: '  Description',
                              labelStyle: const TextStyle(
                                fontSize: 16,
                                color: Color(0xffBCBCBC),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            focusNode: _descriptionfocusNode,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05,
                        bottom: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffBCBCBC),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Datepicker1(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05,
                        bottom: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffBCBCBC),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            prefixText: '   ',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                              bottom: 15,
                            ),
                            //prefixIcon: const Icon(Icons.home, color: Colors.white),
                            labelText: '  Assign To',
                            labelStyle: const TextStyle(
                              fontSize: 16,
                              color: Color(0xffBCBCBC),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_attachmentsfocusNode);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05,
                        bottom: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffBCBCBC),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          focusNode: _attachmentsfocusNode,
                          decoration: InputDecoration(
                            prefixText: '   ',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                              bottom: 15,
                            ),
                            //prefixIcon: const Icon(Icons.home, color: Colors.white),
                            labelText: '  Attachments',
                            labelStyle: const TextStyle(
                              fontSize: 16,
                              color: Color(0xffBCBCBC),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05,
                        bottom: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffBCBCBC),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: DropdownGrade(),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 4.0,
                            spreadRadius: 5.0,
                            offset: const Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Color(0xff797979),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _addTask();
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 4.0,
                            spreadRadius: 5.0,
                            offset: const Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          ),
                        ],
                        color: const Color(0xff6169BB),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Create',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> gradeItems = [
    const DropdownMenuItem(child: Text('Grade 1'), value: 'Grade 1'),
    const DropdownMenuItem(child: Text('Grade 2'), value: 'Grade 2'),
    const DropdownMenuItem(child: Text('Grade 3'), value: 'Grade 3'),
    const DropdownMenuItem(child: Text('Grade 4'), value: 'Grade 4'),
  ];
  return gradeItems;
}
