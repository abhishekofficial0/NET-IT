import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:net_it/models/user_task.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:net_it/models/login_model.dart';

class APIService{
  Future<loginResponseModel> login(loginRequestModel requestModel) async {
    Uri url = Uri.parse('http://3.134.111.11:5000/api/v1/users/login' ); 

    var response = await http.post(url,headers: {"Content-Type": "application/json"}, body: json.encode(requestModel) );

    

    if (response.statusCode == 200 || response.statusCode == 401 || response.statusCode == 400) {

      return loginResponseModel.fromJson(json.decode(response.body));

    }else{
      print(response.statusCode);
      throw Exception('failed to load data');
    }

  }
}

class Task{
  Future<UserTask> tasks() async {
    Uri taskURL = Uri.parse('http://3.134.111.11:5000/api/v1/tasks' );

    var tasResponse = await http.get(taskURL,headers: {"Content-Type": "application/json"},);
    if(tasResponse.statusCode == 200 || tasResponse.statusCode == 401 || tasResponse.statusCode == 400){
      
      return UserTask.fromJson(json.decode(tasResponse.body));
    }
    else{
      print(tasResponse.statusCode);
      throw Exception('failed to load');
    }
  }
}

class PswUpdate{
  Future psw() async {
    
  }
}