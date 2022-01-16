class UserModel {
  String? uid;
  String? email;
  String? name;
  String? urlAvatar;

  UserModel({this.uid, this.email, this.name, this.urlAvatar});

  // receive data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      urlAvatar: map['urlAvatar'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'urlAvatar':
          urlAvatar, //new users didn't add profile pic, so give a empty url
    };
  }
}
