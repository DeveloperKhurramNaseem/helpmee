

class CooperationPartner {
  static const idKey = 'id',
      titleKey = 'title',
      titleDeKey = 'title_de',
      profileCodeKey = 'profile_code';
  static const profileIdKey = 'profile_type_id',
      iconKey = 'icon',
      descriptionKey = 'description',
      deDescriptionKey = 'de_description';
  static const profileTypeTitleKey = 'profile_type_title',
      statusKey = 'status',
      baseUrlKey = 'base_url',
      isActiveKey = 'is_active',
      profileIconSvgDefaultKey = 'profile_icon_svg_default';
  static const shortDescriptionKey = 'short_description',
      deShortDescriptionKey = 'de_short_description';
  int id;
  String title;
  String titleDe;
  String profileCode;
  int profileTypeId;
  String baseUrl;
  String icon;
  String description;
  String isActive;
  String deDescription;
  String profileTypeTitle;
  int status;
  String profileIconSvgDefault;
  String shortDescription;
  String deShortDescription;
  CooperationPartner({
    required this.id,
    required this.title,
    required this.titleDe,
    required this.profileCode,
    required this.profileTypeId,
    required this.icon,
    required this.baseUrl,
    required this.description,
    required this.deDescription,
    required this.profileTypeTitle,
    required this.status,
    required this.isActive,
    required this.profileIconSvgDefault,
    required this.shortDescription,
    required this.deShortDescription,
  });

  factory CooperationPartner.fromMap(Map<String, dynamic> map) {
    return CooperationPartner(
      id: map[idKey] ?? 0,
      title: map[titleKey] ?? '',
      titleDe: map[titleDeKey] ?? '',
      profileCode: map[profileCodeKey] ?? '',
      profileTypeId: map[profileIdKey] ?? 0,
      icon: map[iconKey] ?? '',
      baseUrl: map[baseUrlKey] ?? '',
      isActive: map[isActiveKey] ?? '',
      description: map[descriptionKey] ?? '',
      deDescription: map[deDescriptionKey] ?? '',
      profileTypeTitle: map[profileTypeTitleKey] ?? '',
      status: map[statusKey] ?? 0,
      profileIconSvgDefault: map[profileIconSvgDefaultKey] ?? '',
      shortDescription: map[shortDescriptionKey] ?? '',
      deShortDescription: map[deShortDescriptionKey] ?? '',
    );
  }

  factory CooperationPartner.empty() {
    return CooperationPartner(
      id: 0,
      title: '',
      titleDe: '',
      profileCode: '',
      profileTypeId: 0,
      icon: '',
      isActive: '',
      description: '',
      baseUrl: '',
      deDescription: '',
      profileTypeTitle: '',
      status: 0,
      profileIconSvgDefault: '',
      shortDescription: '',
      deShortDescription: '',
    );
  }
}
