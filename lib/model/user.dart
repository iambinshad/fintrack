import 'dart:convert';

class User {
    final String name;
    final String email;
    final String password;
    final String address;
    final String type;
    final String id;
    final String token;
    final int v;

    User( {
      required this.token,
        required this.name,
        required this.email,
        required this.password,
        required this.address,
        required this.type,
        required this.id,
        required this.v,
    });

    factory User.fromJson(String sourcce)=> User.fromMap(json.decode(sourcce)); 

    factory User.fromMap(Map<String, dynamic> map) => User(
        name: map["name"],
        token:map["token"],
        email: map["email"],
        password: map["password"],
        address: map["address"],
        type: map["type"],
        id: map["_id"],
        v: map["__v"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "token":token,
        "email": email,
        "password": password,
        "address": address,
        "type": type,
        "_id": id,
        "__v": v,
    };
}
