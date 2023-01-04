class Person {
  final String name;
  final DateTime birthday;

  int get days => _getFullDays();

  Person({required this.name, required this.birthday});

  int _getFullDays() {
    return DateTime.now().difference(birthday).inDays;
  }

  Person.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        birthday = DateTime.parse(json['birthday']);

  @override
  String toString() {
    return 'Человек:\nИмя: $name,\nДней: $days';
  }
}
