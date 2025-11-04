class DiseaseInfo {

  static const nameKey = 'type' , medicationsKey = 'medications', detailsKey = 'details', isCheckKey = 'is_check';

  String name;
  String medications;
  String details;
  String isCheck;

  DiseaseInfo({
    required this.name,
    required this.medications,
    required this.details,
    required this.isCheck,
  });

  Map<String, dynamic> toMap() {
    return {
      nameKey: name,
      medicationsKey: medications,
      detailsKey: details,
      isCheckKey: isCheck,
    };
  }

}
