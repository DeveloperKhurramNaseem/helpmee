class ProductModel {

  static const idKey = 'id' , assignedToKey = 'assigned_to', serialNumberKey = 'serial_number',
      nameKey = 'name', productTypeKey = 'product_type', activatedOnKey = 'activated_on',
      expiresOnKey = 'expires_on', lastScannedOnKey = 'last_scanned_on', lastScannedAtKey = 'last_scanned_at',
      productImageKey = 'product_image';

  int id;
  int assignedTo;
  String serialNumber;
  String name;
  String productType;
  String activatedOn;
  String expiresOn;
  String lastScannedOn;
  String lastScannedAt;
  String productImage;

  ProductModel({
    required this.id,
    required this.assignedTo,
    required this.serialNumber,
    required this.name,
    required this.productType,
    required this.activatedOn,
    required this.expiresOn,
    required this.lastScannedOn,
    required this.lastScannedAt,
    required this.productImage,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
      id: json[idKey] ?? 0,
      assignedTo: json[assignedToKey] ?? 0,
      serialNumber: json[serialNumberKey] ?? '',
      name: json[nameKey] ?? '',
      productType: json[productTypeKey] ?? '',
      activatedOn: json[activatedOnKey] ?? '',
      expiresOn: json[expiresOnKey] ?? '',
      lastScannedOn: json[lastScannedOnKey] ?? DateTime.now().toIso8601String(),
      lastScannedAt: json[lastScannedAtKey] ?? '',
      productImage: json[productImageKey] ?? '',
    );
  }
}
