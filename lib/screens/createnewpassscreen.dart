import 'package:flutter/material.dart';
import 'package:net_it/api/api_service.dart';
import 'package:net_it/models/login_model.dart';
import 'package:net_it/models/user_task.dart';
import 'package:net_it/progress_hud.dart';
import 'package:flutter/widgets.dart';
import 'package:net_it/screens/forgotpassscreen.dart';
import 'package:net_it/screens/homescreen.dart';
import './forgotpassscreen.dart';
import 'createnewpassscreen.dart';



class CreateNewPassScreen extends StatelessWidget {
  bool _showPassword = false;
  loginResponseModel user;
  UserTask task;
  List<dynamic> item;


  CreateNewPassScreen({required this.user, required this.item, required this.task, Key? key}) : super(key: key);
  static const routeName = 'create-pass-page';
  
  void _togglevisibility() {
      _showPassword = !_showPassword;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ClipPath(
          // clipper: CustomClipPath(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.93,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/wave2.png'),
                    ),
                  ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          bottom: 40,
                        ),
                        child: Center(
                          child: Text(
                            'Hello',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.1,
                          left: 100,
                          right: 100,
                        ),
                        child: const Center(
                          child: Text(
                            'Create your own password to proceed further',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Form(
                        child: Padding(
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
                              // controller: _passwordController,
                              obscureText: !_showPassword,
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
                                  Icons.lock_open_rounded,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _togglevisibility();
                                  },
                                  child: Icon(
                                    _showPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    //color: Colors.red,
                                  ),
                                ),
                                labelText: 'Create New Password',
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
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
                                'Reset & Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                              if(task.count >= 0){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => 
                                    HomeScreen(user: user,task: task,item: item),
                                  )
                                );
                              }
                            }
                          ),
                      ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
