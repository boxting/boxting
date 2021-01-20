class User {
  final String id;
  final String name;
  final String lastname;
  final String dni;
  final String mail;
  final String phone;
  final String username;

  User({
    this.name,
    this.lastname,
    this.dni,
    this.id,
    this.mail,
    this.phone,
    this.username,
  });
  @override
  String toString() => 'User: ${name} ${lastname} ${dni} ${mail}';
}
