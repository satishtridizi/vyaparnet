class BusinessProfileModel {
  String businessName;
  String category;
  List<String> images;
  String description;
  List<String> products;
  List<String> serviceAreas;
  String address;
  String landmark;
  String city;
  String pincode;

  BusinessProfileModel({
    required this.businessName,
    required this.category,
    required this.images,
    required this.description,
    required this.products,
    required this.serviceAreas,
    required this.address,
    required this.landmark,
    required this.city,
    required this.pincode,
  });
}
