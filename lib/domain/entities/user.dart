import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String lastname;
  @HiveField(3)
  final String dni;
  @HiveField(4)
  final String mail;
  @HiveField(5)
  final String phone;
  @HiveField(6)
  final String username;
  final String birthday;

  User({
    this.name,
    this.lastname,
    this.dni,
    this.id,
    this.mail,
    this.phone,
    this.username,
    this.birthday,
  });
  @override
  String toString() => 'User: ${name} ${lastname} ${dni} ${mail}';
}
