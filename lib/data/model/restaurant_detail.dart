class RestaurantDetail {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Category> categories;
  final Menus menus;
  final num rating;
  final List<CustomerReview> customerReviews;

  RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'city': city,
      'address': address,
      'pictureId': pictureId,
      'categories': categories.map((category) => category.toJson()).toList(),
      'menus': menus.toJson(),
      'rating': rating,
      'customerReviews': customerReviews
          .map((customerReview) => customerReview.toJson())
          .toList(),
    };
  }

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) =>
      RestaurantDetail(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        categories: List<Category>.from(
          json["categories"].map((category) => Category.fromJson(category)),
        ),
        menus: Menus.fromJson(json["menus"]),
        rating: json["rating"],
        customerReviews: List<CustomerReview>.from(
          json["customerReviews"]
              .map((customerReview) => CustomerReview.fromJson(customerReview)),
        ),
      );
}

class Category {
  final String name;

  Category({required this.name});

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
      );
}

class CustomerReview {
  final String name;
  final String review;
  final String date;

  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'review': review,
        'date': date,
      };

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );
}

class Menus {
  final List<Category> foods;
  final List<Category> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  Map<String, dynamic> toJson() => {
        'foods': foods.map((food) => food.toJson()).toList(),
        'drinks': drinks.map((drink) => drink.toJson()).toList(),
      };

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Category>.from(
          json['foods'].map((food) => Category.fromJson(food)),
        ),
        drinks: List<Category>.from(
          json["drinks"].map((drink) => Category.fromJson(drink)),
        ),
      );
}
