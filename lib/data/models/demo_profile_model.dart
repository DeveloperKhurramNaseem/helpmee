class DemoProfileModel {
  static const userNameKey = 'username';
  String userName;
  int id;
  int userGroupId;
  String remark;
  String link;
  
  DemoProfileModel({
    required this.id,
    required this.userGroupId,
    required this.remark,
    required this.link,
    required this.userName,
  });

  factory DemoProfileModel.fromMap(Map<String,dynamic> map){
    return DemoProfileModel(userName: map[userNameKey] ?? '' , id: map['id'] ?? 0, userGroupId: map['user_group_id'] ?? 0, remark: map['remark'] ?? '', link: map['link'] ?? '');
  }
}
