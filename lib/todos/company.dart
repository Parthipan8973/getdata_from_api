class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company.fromJson(dynamic json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }
  @override
  String toString() {
    return '$name \n $catchPhrase \n $bs';
  }
}
