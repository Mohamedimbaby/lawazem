class User {
  int? id;
  String? accessToken, refreshToken, email, firstName, lastName;

  User(this.id, this.accessToken, this.refreshToken, this.email, this.firstName,
      this.lastName);

  static Future<User> fromJson(response) async {
    return User(
        response["id"],
        response["access_token"],
        response["refresh_token"],
        response["email"],
        response["first_name"],
        response["last_name"]);
  }
}
