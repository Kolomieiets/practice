class NameData {
  String? name;
  String? surname;
  NameData({this.name, this.surname});

  NameData.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
  }

  Map<dynamic, dynamic> toJson() => {
      'name': name,
      'surname': surname,
    };
  
}
