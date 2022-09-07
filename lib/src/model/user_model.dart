class UserModel {
  String? id;
  String? userName;
  String? userEmail;
  String? userToken;


  UserModel(
      {this.id,
      this.userEmail,
      this.userName,
      this.userToken,
      });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        userEmail: json["email"],
        userName: json["name"],
        userToken: json["access_token"],
      );
}
