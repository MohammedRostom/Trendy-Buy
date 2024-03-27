class UserModel {
  String? id;
  final String email;
  final String password;
  String? passwordConfirm;

  UserModel({
    this.id,
    required this.email,
    required this.password,
    this.passwordConfirm,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      email: json['email'],
      password: json['password'],
      passwordConfirm: json['passwordConfirm'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'passwordConfirm': passwordConfirm ?? password,
    };
  }
}
