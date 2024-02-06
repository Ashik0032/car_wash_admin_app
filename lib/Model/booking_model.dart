class BookingModel {
  String addYourLocation;
  String addYourNote;
  String id;
  String images;
  String paymentMethod;
  String picService;
  String picSlot;
  String picYourComfort;
  String serviceVehicle;
  String takeDate;
  String status;
  BookingModel({
    required this.addYourLocation,
    required this.addYourNote,
    required this.id,
    required this.images,
    required this.paymentMethod,
    required this.picService,
    required this.picSlot,
    required this.picYourComfort,
    required this.serviceVehicle,
    required this.takeDate,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      "addYourLocation": this.addYourLocation,
      "addYourNote": this.addYourNote,
      "id": this.id,
      "images": this.images,
      "paymentMethod": this.paymentMethod,
      "picService": this.picService,
      "picSlot": this.picSlot,
      "picYourComfort": this.picYourComfort,
      "serviceVehicle": this.serviceVehicle,
      "takeDate": this.takeDate,
      "status": this.status,
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> Map) {
    return BookingModel(
      addYourLocation: Map["addYourLocation"] ?? "",
      addYourNote: Map["addYourNote"] ?? "",
      id: Map["id"] ?? "",
      images: Map["images"] ?? "",
      paymentMethod: Map["paymentMethod"] ?? "",
      picService: Map["paymentMethod"] ?? "",
      picSlot: Map["picSlot"] ?? "",
      picYourComfort: Map["picYourComfort"] ?? "",
      serviceVehicle: Map["serviceVehicle"] ?? "",
      takeDate: Map["takeDate"] ?? "",
      status: Map["status"] ?? "",
    );
  }

  BookingModel copyWith({
    String? addYourLocation,
    String? addYourNote,
    String? id,
    String? images,
    String? paymentMethod,
    String? picService,
    String? picSlot,
    String? picYourComfort,
    String? serviceVehicle,
    String? takeDate,
    String? status,
  }) {
    return BookingModel(
        addYourLocation: addYourLocation ?? this.addYourLocation,
        addYourNote: addYourNote ?? this.addYourNote,
        id: id ?? this.id,
        images: images ?? this.images,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        picService: picService ?? this.picService,
        picSlot: picSlot ?? this.picSlot,
        picYourComfort: picYourComfort ?? this.picYourComfort,
        serviceVehicle: serviceVehicle ?? this.serviceVehicle,
        takeDate: takeDate ?? this.takeDate,
        status: status ?? this.status
    );
  }
}
