class Product {
  final String? id;
  final String? name;
  final String? price;
  final String? description;

  Product({this.name, this.price, this.description, this.id});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['pname'],
      price: json['pprice'],
      description: json['pdescription']
    );
  }
}
