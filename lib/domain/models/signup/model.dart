import 'dart:convert';

class SignUpModel {
  final String useremail;
  final String password;

  SignUpModel({required this.useremail, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'useremail': useremail,
      'password': password,
    };
  }

  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      useremail: map['useremail'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromJson(String source) =>
      SignUpModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
