class ContactInfo {

  static const nameKey = 'name' , phoneNumberKey = 'phone_no' , whatsappNoKey = 'whatsapp_no';

  String name;  
  String phoneNumber;
  String whatsappNumber;

  ContactInfo({
    required this.name,
    required this.phoneNumber,
    required this.whatsappNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      nameKey: name,
      phoneNumberKey: phoneNumber,
      whatsappNoKey: whatsappNumber,
    };
  }
}