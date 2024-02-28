class userModel {
  String? name;
  String? email;
  String? password;
  bool? google;
  String? id;
  String? images;
  String? phoneNumber;
  List? vehicles;
  userModel({
    this.name,
    this.email,
    this.password,
    this.google,
    this.id,
    this.images,
    this.phoneNumber,
    this.vehicles,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "email": this.email,
      "password": this.password,
      "google": this.google,
      "id": this.id,
      "images": this.images,
      "phoneNumber": this.phoneNumber,
      "vehicles": this.vehicles
    };
  }

  factory userModel.fromMap(Map<String, dynamic> Map) {
    return userModel(
      name: Map["name"] ?? "",
      email: Map["email"] ?? "",
      password: Map["password"] ?? "",
      google: Map["google"] ?? false,
      id: Map["id"] ?? "",
      images: Map["images"] ?? "",
      phoneNumber: Map["phoneNumber"] ?? "",
      vehicles: Map["vehicles"] ?? [],
    );
  }

  userModel copyWith({
    String? name,
    String? email,
    String? password,
    bool? google,
    String? id,
    String? images,
    String? phoneNumber,
    List? vehicles,
  }) {
    return userModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      // google: google ?? this.google,
      google: google ?? this.google,
      id: id ?? this.id,
      images: images ?? this.images,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      vehicles: vehicles ?? this.vehicles,
    );
  }
}
