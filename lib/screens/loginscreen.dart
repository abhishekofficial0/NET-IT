// ignore_for_file: non_constant_identifier_names, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:net_it/api/api_service.dart';
import 'package:net_it/models/login_model.dart';
import 'package:net_it/models/user_task.dart';
import 'package:net_it/progress_hud.dart';
import 'package:net_it/screens/homescreen.dart';
import './forgotpassscreen.dart';
import 'createnewpassscreen.dart';

class LoginScreenPage extends StatefulWidget {
  static const routeName = 'login';
  const LoginScreenPage({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreenPage> {
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> GlobalFormKey = GlobalKey<FormState>();
  loginRequestModel? requestModel;
  bool isApiCallProgress = false;
  dynamic user;
  bool _showPassword = false;

  @override
  initState() {
    super.initState();
    requestModel = loginRequestModel(email: '', password: '');
  }

  @override
  Widget build(BuildContext context) {
    return progress_hud(
      child: _uisetup(context),
      inAsyncCall: isApiCallProgress,
      opacity: 0.3,
    );
  }

  @override
  Widget _uisetup(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.95,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/wave2.png'),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: GlobalFormKey,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              bottom: 40,
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 30,
                              right: 30,
                              bottom: 10,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(
                                    bottom: 15,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.account_circle,
                                  ),
                                  labelText: 'Username',
                                  labelStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onSaved: (value) =>
                                    requestModel?.email = value!,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 30,
                              right: 30,
                              bottom: 10,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '     Please enter your Password';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(
                                    bottom: 15,
                                  ),
                                  prefixIcon: const Icon(Icons.lock_rounded),
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onSaved: (value) =>
                                    requestModel?.password = value!,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 70),
                      child: TextButton(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff6169BB),
                          ),
                          child: const Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (validateAndSave()) {
                            setState(() {
                              isApiCallProgress = true;
                            });
                            Task task = Task();
                            APIService apiservice = APIService();
                            List<dynamic> _item;
                            Data items;
                            apiservice.login(requestModel!).then((value) => {
                              setState(() {
                                isApiCallProgress = false;
                              }),
                              if(value.id.isNotEmpty) {
                                task.tasks().then((value1) => {
                                  _item = [],
                                  
                                  for(var itm in value1.data) {
                                    items = Data(id: itm['id'] ?? 0, name: itm['name'] , assigned_date: itm['assigned_date'], description: itm['description'], due_date: itm['due_date'], slug: itm['slug'], task_assigned_by: itm['task_assigned_by'], task_assigned_to: itm['task_assigned_to'], task_grade: itm['task_grade'], task_status: itm['task_status'],),
                                    _item.add(items),
                                  },
                                    
                                  if(value.firstTimeUser == true)  {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => 
                                        CreateNewPassScreen(user: value,task: value1,item: _item),
                                      )
                                    )
                                  }
                                  else{
                                    if(value1.count >= 0){
                                      Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => 
                                          HomeScreen(user: value,task: value1,item: _item),
                                        )
                                      ),
                                    }
                                  }
                                }),
                              }                                  
                              else{
                                print(value.error),
                              },

                            }

                                );
                          }
                          
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ForgotPassScreen.routeName);
                      },
                      child: const Text(
                        'Forgot Your Password?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = GlobalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
