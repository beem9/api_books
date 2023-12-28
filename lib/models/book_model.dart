class Book {
  int? id;
  String? title;
  String? price;
  String? image;
  String? description;

  Book({
    this.id,
    this.title,
    this.price,
    this.image,
    this.description,
  });

  Book.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'] as int?;
      title = json['title'] as String?;
      price = json['price'].toString();
      image = json['image'] as String?;
      description = json['description'] as String?;
    } catch (e) {
      print(e.toString());
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['price'] = price;
    json['image'] = image;
    json['description'] = description;
    return json;
  }
}
