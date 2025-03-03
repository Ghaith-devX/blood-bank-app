class UserModel {
  final String email;
  final String username;
  final String bloodType;
  final String location;

  UserModel({
    required this.email,
    required this.username,
    required this.bloodType,
    required this.location,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      username: json['username'],
      bloodType: json['bloodType'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'bloodType': bloodType,
      'location': location,
    };
  }
}
