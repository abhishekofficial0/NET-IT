// ignore_for_file: camel_case_types

class loginResponseModel {
  final String error;
  final String status;
  final String id;
  final String name;
  final String email;
  final String role;
  final bool firstTimeUser;
  final String department;
  final String createdAt;
  final String birthDay;
  final bool success;

  loginResponseModel({
    required this.success,
    required this.error,
    required this.status,
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.firstTimeUser,
    required this.department,
    required this.createdAt,
    required this.birthDay,
  });

  factory loginResponseModel.fromJson(Map<String, dynamic> json) {
    return loginResponseModel(
      success: json["success"] ?? false,
      error: json["error"] ?? "",
      status: json["status"] ?? "",
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      role: json["role"] ?? "",
      firstTimeUser: json["first_time_user"] ?? false,
      department: json["department"] ?? "",
      createdAt: json["createdAt"] ?? "",
      birthDay: json["birthday"] ?? "",
    );
  }
}

class loginRequestModel {
  String email;
  String password;

  loginRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email':email,
      'password':password,
    };
    return map;
  }
}
