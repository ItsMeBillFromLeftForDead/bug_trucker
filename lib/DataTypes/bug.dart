class Bug {
  int? id;
  String? title;
  double? price;
  String? category;
  String? description;
  String? image;
  Map<String, dynamic>? rating;

  Bug(
      this.id,
      this.title,
      this.price,
      this.category,
      this.description,
      this.image,
      this.rating,
      );

  Bug.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        price = double.parse(json['price'].toString()),
        category = json['category'],
        description = json['description'],
        image = json['image'],
        rating = json['rating'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'category': category,
    'description': description,
    'image': image,
    'rating': rating,
  };
}