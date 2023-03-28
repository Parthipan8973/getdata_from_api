import 'address.dart';
import 'company.dart';

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;
  Address? address;
  Company? company;

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
    address = Address.fromJson(json['address']);
    company = Company.fromJson(json['company']);
  }
  @override
  String toString() {
    return ' User id  :$id \n '
        'User Name : $name \n '
        'user Mail: $email \n '
        'User Phone : $phone \n  '
        'User Web Site $website \n '
        '$address \n '
        '$company';
  }
}
