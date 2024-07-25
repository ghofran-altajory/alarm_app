class PersonaldataModule {
  String? name;
  String? phone;
  String? familyPhone;
  String? gender;

  PersonaldataModule({this.name, this.phone, this.familyPhone, this.gender});

  PersonaldataModule.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    phone = json['phone'] ?? "";
    familyPhone = json['familyPhone'] ?? "";
    gender = json['gender'] ?? "";
  }
}
