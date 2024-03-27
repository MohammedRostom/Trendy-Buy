class ProductModel {
  final String? id;
  final String title;
  final price;
  final String description;
  final String category;
  final String image;
  Rating rating;

  ProductModel({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      id: data['_id'],
      title: data['title'],
      price: data['price'],
      description: data['description'],
      category: data['category'], // Assuming there's a Category.fromJson method
      image: data['image'],
      rating: Rating.fromJson(data["rating"]),

      // Assuming there's a Rating.fromJson method
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'category': category,
      'image': image,
      'price': price,
      "rating": rating.toJson(),
    };
  }
}

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    this.count = 0,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
