class PropertyInfoModel {
  PropertyInfoModel({
    required this.bedrooms,
    required this.bathrooms,
    required this.areasize,
    required this.stories,
    required this.formid,
    required this.userid,
    required this.tab,
    required this.squarefootage,
  });
  String bedrooms,
      bathrooms,
      areasize,
      stories,
      squarefootage,
      formid,
      userid,
      tab;
  // constructor that convert json to object instance
  factory PropertyInfoModel.fromJson(Map<String, dynamic> json) =>
      PropertyInfoModel(
        bedrooms: json['bedrooms'],
        bathrooms: json['bathrooms'],
        areasize: json['areasize'],
        stories: json['stories'],
        formid: json['formid'],
        userid: json['user_id'],
        tab: json['tab'],
        squarefootage: json['squarefootage'],
      );

// a method that convert obj to json String
  Map<String, dynamic> toJson() => {
        'bedrooms': bedrooms,
        'bathrooms': bathrooms,
        'areasize': areasize,
        'stories': stories,
        'formid': formid,
        'user_id': userid,
        'tab': tab,
        'squarefootage': squarefootage,
      };
}
