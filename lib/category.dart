class Category{
  int id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }
}