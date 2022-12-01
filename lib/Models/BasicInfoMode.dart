class BasicInfoModel {
  BasicInfoModel({
    required this.title,
    required this.phone,
    required this.name,
    required this.location,
    required this.userid,
    required this.tab,
  });
  String title, phone, name, location, userid, tab;
  // constructor that convert json to object instance
  factory BasicInfoModel.fromJson(Map<String, dynamic> json) => BasicInfoModel(
        title: json['title'],
        location: json['location'],
        phone: json['phone'],
        name: json['ownerName'],
        userid: json['user_id'],
        tab: json['tab'],
      );

// a method that convert obj to json String
  Map<String, dynamic> toJson() => {
        'title': title,
        'location': location,
        'phone': phone,
        'user_id': userid,
        'tab': tab,
        'ownerName': name,
      };
}
