import 'dart:convert';

class Profile {
  int id;
  String name;
  String email;
  int age;

  Profile(
      {this.id = 0,
      required this.name,
      required this.email,
      required this.age});

  // map型で一括で受け取るためにfactoryで受け皿作ってからコンストラクター使うようにしている
  // このほうがクライアント側での引数のしていがきれいになっていいかもね(10個引数とかあったりするとかなりメリット享受できそう)
  factory Profile.fromJson(Map<String, dynamic> map) {
    return Profile(
        id: map["id"], name: map["name"], email: map["email"], age: map["age"]);
  }

  // Jsonの形で返す
  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email, "age": age};
  }

  // Stringの形で返す
  @override
  String toString() {
    return 'Profile{id: $id, name: $name, email: $email, age: $age}';
  }
}

// jsonからProfile型へ変換(戻す)
List<Profile> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Profile>.from(data.map((item) => Profile.fromJson(item)));
}

// Profile型からjson型へ変換
String profileToJson(Profile data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
