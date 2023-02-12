

class UserModel {
  
  final String? username;
  final String? password;
  final String? avatar;
  final String? birth;
  final String? gender;
  final String? phone;
 

  UserModel(
      {
      required this.username,
      required this.password,
      this.avatar,
      required this.birth,
      required this.gender,
      required this.phone,
    
      });

  factory UserModel.fromJson(Map<String, dynamic>? data) {
    return UserModel(
        username: data?["username"],
        password: data?["password"],
        avatar: data?["avatar"],
        birth: data?["birth"],
        gender: data?["gender"],
        phone: data?["phone"],
        
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
      
     
    };
  }

  Map<String, dynamic>? data(String? docId) {}
}
