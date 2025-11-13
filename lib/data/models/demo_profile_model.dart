class DemoProfileModel {
  static const userNameKey = 'username';
  String userName;
  
  DemoProfileModel({
    required this.userName,
  });

  factory DemoProfileModel.fromMap(Map<String,dynamic> map){
    return DemoProfileModel(userName: map[userNameKey] ?? '');
  }
}