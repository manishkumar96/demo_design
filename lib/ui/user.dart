class User {
  String? gender;

  User({this.gender});

  static List<User> getUsers() {
    return <User>[
      User(
        gender: "Male",
      ),
      User(
        gender: "Female",
      ),
    ];
  }
}
