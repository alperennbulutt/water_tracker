class UserPersonalInformationModel {
  final String email;
  final String gender;
  final String name;
  final String userId;
  final int weight;

  UserPersonalInformationModel({
    required this.email,
    required this.gender,
    required this.name,
    required this.userId,
    required this.weight,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'weight': weight,
      };

  static UserPersonalInformationModel fromJson(Map<String, dynamic> json) =>
      UserPersonalInformationModel(
          email: json['email'],
          gender: json['gender'],
          name: json['name'],
          userId: json['userId'],
          weight: json['weight']);
}
