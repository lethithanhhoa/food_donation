class Food {
  int id;
  int restaurantId;
  String name;
  String description;
  int quantity;
  String status;
  String imagePath;
  DateTime finishDate;
  DateTime publishDate;

  Food(
      {this.id,
      this.restaurantId,
      this.name,
      this.description,
      this.quantity,
      this.status,
      this.imagePath,
      this.publishDate,
      this.finishDate});

  factory Food.fromJson(Map<String, dynamic> data) {
    return Food(
      id: data['id'],
      restaurantId: data['restaurant_id'],
      name: data['name'],
      description: data['description'],
      quantity: data['quantity'],
      status: data['status'],
      imagePath: data['image_path'],
      // publishDate: data['publish_date'],
      // finishDate: data['finish_date'],
    );
  }
}
