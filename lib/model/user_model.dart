

class UserModel {
  
  final String? username;
  final String? password;
  final String? avatar;
  final String? birth;
  final String? gender;
  final String? phone;
  final String? id;

  UserModel(
      {
      required this.username,
      required this.password,
      this.avatar,
      required this.birth,
      required this.gender,
      required this.phone,
      this.id
      });

  factory UserModel.fromJson(Map<String, dynamic>? data) {
    return UserModel(
        username: data?["username"],
        password: data?["password"],
        avatar: data?["avatar"],
        birth: data?["birth"],
        gender: data?["gender"],
        phone: data?["phone"],
        id: data?['id'],
       );
  }

  toJson() {
    return {
      "username": username,
      "password": password,
      "avatar": avatar,
      "birth": birth,
      "gender": gender,
      "phone": phone,
      'id': id
     
    };
  }

  Map<String, dynamic>? data(String? docId) {}
}
