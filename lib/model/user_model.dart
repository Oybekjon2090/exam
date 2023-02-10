class UserModel {
  final String? fullname;
  final String? password;
  final String? avatar;
  final String? bio;
  final String? birth;
  final String? email;
  final String? gender;

  UserModel(
      {required this.fullname,
      required this.password,
      required this.avatar,
      this.bio,
      required this.birth,
      required this.email,
      required this.gender});

  factory UserModel.fromJson(Map<String, dynamic>? data) {
    return UserModel(
      fullname: data?["fullname"],
      password: data?["password"],
      avatar: data?["avatar"],
      bio: data?["bio"],
      birth: data?["birth"],
      email: data?["email"],
      gender: data?["gender"],
    );
  }

    toJson() {
    return {

      "username": fullname,
      "password": password,
      "avatar": avatar,
      "bio": bio,
      "birth": birth,
      "email": email,
      "gender": gender,

    };
  }
  

  // UserModel(

  //     required this.password,
  //     this.avatar,
  //     this.bio,
  //     required this.birth,
  //     required this.email,
  //     required this.gender,
  //     required this.fullname,

  // factory UserModel.fromJson(Map<String, dynamic>? data) {
  //   return UserModel(

  //       username: data?["fullname"],
  //       password: data?["password"],
  //       avatar: data?["avatar"],
  //       bio: data?["bio"],
  //       birth: data?["birth"],
  //       email: data?["email"],
  //       gender: data?["gender"],

  // }

  // toJson() {
  //   return {

  //     "username": fullname,
  //     "password": password,
  //     "avatar": avatar,
  //     "bio": bio,
  //     "birth": birth,
  //     "email": email,
  //     "gender": gender,

  //   };
  // }
}
