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

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      username: map['username'],
      bloodType: map['bloodType'],
      location: map['location'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'bloodType': bloodType,
      'location': location,
    };
  }
}
