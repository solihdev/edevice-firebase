class UserModel {
  final String userId;
  final String fullName;
  final String email;
  final int age;
  final String createdAt;

  UserModel({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.age,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'] as String? ?? "",
      fullName: json['full_name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      age: json['age'] as int? ?? 0,
      createdAt: json['created_at'] as String? ?? "",
    );
  }
}
