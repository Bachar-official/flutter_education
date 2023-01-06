class Cat {
  final int id;
  final String name;
  final int age;

  Cat({required this.id, required this.name, required this.age});

  Cat.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        age = map['age'];

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'age': age,
      };

  @override
  String toString() => 'Cat (id=$id, name=$name, age=$age)';
}
