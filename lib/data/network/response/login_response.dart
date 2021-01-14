class LoginResponse {
  bool success;
  Data data;

  LoginResponse({this.success, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String username;
  Role role;
  Voter voter;
  String token;

  Data({this.id, this.username, this.role, this.voter, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    voter = json['voter'] != null ? Voter.fromJson(json['voter']) : null;
    token = json['token'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    if (role != null) {
      data['role'] = role.toJson();
    }
    if (voter != null) {
      data['voter'] = voter.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class Role {
  String name;

  Role({this.name});

  Role.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Voter {
  int id;
  String firstName;
  String lastName;
  String dni;
  String mail;
  String phone;

  Voter({
    this.id,
    this.firstName,
    this.lastName,
    this.dni,
    this.mail,
    this.phone,
  });

  Voter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    dni = json['dni'];
    mail = json['mail'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['dni'] = dni;
    data['mail'] = mail;
    data['phone'] = phone;
    return data;
  }
}
