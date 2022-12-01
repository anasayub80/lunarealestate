class UserModel {
  String id, name, email, phone, profile, role;
  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.profile,
    required this.role,
  });
  // constructor that convert json to object instance
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        phone: json['phone'],
        profile: json['profile'],
        role: json['role'],
      );

// a method that convert obj to json String
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'phone': phone,
        'profile': profile,
        'role': role,
      };
}
