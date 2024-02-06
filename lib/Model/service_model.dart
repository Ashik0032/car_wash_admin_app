class ServiceModel{

  String? icon;
  String? name;
  // String? image;
  String? moto;
  String? description;
  List? service;
  num? price;
  // int? data;
  ServiceModel({
    this.icon,
    this.name,
    // this.image,
    this.moto,
    this.description,
    this.service,
    this.price,
  });

  Map<String ,dynamic> toMap(){
    return {
      "icon":this.icon,
       "name":this.name,
        // "image":this.image,
     "moto":this.moto,
      "description":this.description,
      "service":this.service,
      "price":this.price,
    };

  }

  factory ServiceModel.fromMap(Map<String,dynamic>Map){
    return ServiceModel(
      icon:  Map["icon"] ?? "",
      name: Map["name"] ?? "",
      // image:  Map["image"] ?? "",
      moto:  Map["moto"] ?? "",
      description:  Map["description"] ?? "",
      service:  Map["service"] ?? [],
      price:  Map["price"] ?? 0,

    );
  }

  ServiceModel copyWith({
    String? icon,
    String? name,
    String? image,
    String? moto,
    String? description,
    List? service,
    num? price,
  }){

    return ServiceModel(
      icon: icon ?? this.icon,
      name: name ?? this.name,
      // image: image ?? this.image,
      moto: moto ?? this.moto,
      description: description ?? this.description,
      service: service ?? this.service,
      price: price ?? this.price,
    );
  }

}