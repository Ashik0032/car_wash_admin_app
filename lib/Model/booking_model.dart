class BookingModel {
  String addYourLocation;
  String addYourNote;
  String userid;
  String images;
  String paymentMethod;
  String picService;
  String picSlot;
  String picYourComfort;
  String serviceVehicle;
  String takeDate;
  String status;
  String id;

  BookingModel({
    required this.addYourLocation,
    required this.addYourNote,
    required this.userid,
    required this.images,
    required this.paymentMethod,
    required this.picService,
    required this.picSlot,
    required this.picYourComfort,
    required this.serviceVehicle,
    required this.takeDate,
    required this.status,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      "addYourLocation": this.addYourLocation,
      "addYourNote": this.addYourNote,
      "userid": this.userid,
      "images": this.images,
      "paymentMethod": this.paymentMethod,
      "picService": this.picService,
      "picSlot": this.picSlot,
      "picYourComfort": this.picYourComfort,
      "serviceVehicle": this.serviceVehicle,
      "takeDate": this.takeDate,
      "status": this.status,
      "id": this.id,
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> Map) {
    return BookingModel(
      addYourLocation: Map["addYourLocation"] ?? "",
      addYourNote: Map["addYourNote"] ?? "",
      userid: Map["userid"] ?? "",
      images: Map["images"] ?? "",
      paymentMethod: Map["paymentMethod"] ?? "",
      picService: Map["picService"] ?? "",
      picSlot: Map["picSlot"] ?? "",
      picYourComfort: Map["picYourComfort"] ?? "",
      serviceVehicle: Map["serviceVehicle"] ?? "",
      takeDate: Map["takeDate"] ?? "",
      status: Map["status"] ?? "",
      id: Map["id"] ?? "",
    );
  }

  BookingModel copyWith({
    String? addYourLocation,
    String? addYourNote,
    String? userid,
    String? images,
    String? paymentMethod,
    String? picService,
    String? picSlot,
    String? picYourComfort,
    String? serviceVehicle,
    String? takeDate,
    String? status,
    String? id,
  }) {
    return BookingModel(
        addYourLocation: addYourLocation ?? this.addYourLocation,
        addYourNote: addYourNote ?? this.addYourNote,
        userid: userid ?? this.userid,
        images: images ?? this.images,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        picService: picService ?? this.picService,
        picSlot: picSlot ?? this.picSlot,
        picYourComfort: picYourComfort ?? this.picYourComfort,
        serviceVehicle: serviceVehicle ?? this.serviceVehicle,
        takeDate: takeDate ?? this.takeDate,
        status: status  ?? this.status,
        id: id  ?? this.id
    );
  }
}
