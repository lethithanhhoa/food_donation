class Restaurant {
  int id;
  String name;
  String detailAddress;
  String ward;
  String district;
  String city;
  String phoneNumber;
  String imagePath;

  Restaurant(
      {this.id,
      this.name,
      this.detailAddress,
      this.ward,
      this.district,
      this.city,
      this.phoneNumber,
      this.imagePath});

  factory Restaurant.fromJson(Map<String, dynamic> data) {
    return Restaurant(
        id: data['id'],
        name: data['name'],
        detailAddress: data['detail_address'],
        ward: data['ward'],
        district: data['district'],
        city: data['city'],
        phoneNumber: data['phone_address'],
        imagePath: data['image_path']);
  }
}
