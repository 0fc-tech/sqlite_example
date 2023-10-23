class Product{
  int id;
  String name;
  String description;
  int category_id;


  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.category_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'description': this.description,
      'category_id': this.category_id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      category_id: map['category_id'] as int,
    );
  }
}