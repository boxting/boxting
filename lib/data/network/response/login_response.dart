class LoginResponse {
  bool success;
  Data data;

  LoginResponse({this.success, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
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
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    voter = json['voter'] != null ? new Voter.fromJson(json['voter']) : null;
    token = json['token'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    if (this.role != null) {
      data['role'] = this.role.toJson();
    }
    if (this.voter != null) {
      data['voter'] = this.voter.toJson();
    }
    data['token'] = this.token;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['dni'] = this.dni;
    data['mail'] = this.mail;
    data['phone'] = this.phone;
    return data;
  }
}
