class CheckDataModule {
  String? diabetes;
  String? bloodPressure;
  String? bloodtype;
  String? weight;
  String? long;
  String? currentdrugs;
  String? vaccines;
  String? chronicdisease;
  String? seriousillnesses;
  String? priorsurgery;
  String? familyillness;
  String? otherillnesses;
  String? allergicto;
 

  CheckDataModule({
    this.diabetes,
    this.bloodPressure,
    this.bloodtype,
    this.weight,
    this.long,
    this.currentdrugs,
    this.vaccines,
    this.chronicdisease,
    this.seriousillnesses,
    this.priorsurgery,
    this.familyillness,
    this.otherillnesses,
    this.allergicto,
   
  });

  CheckDataModule.fromJson(Map<String, dynamic> json) {
    diabetes = json['diabetes'] ?? "";
    bloodPressure = json['bloodPressure'] ?? "";
    bloodtype = json['bloodtype'] ?? "";
    weight = json['weight'] ?? "";
    long = json['long'] ?? "";
    currentdrugs = json['currentDrugs'] ?? "";
    vaccines = json['vaccines'] ?? "";
    chronicdisease = json['chronicDisease'] ?? "";
    seriousillnesses = json['seriousIllnesses'] ?? "";
    priorsurgery = json['priorSurgery'] ?? "";
    familyillness = json['FamilyIllness'] ?? "";
    otherillnesses = json['otherIllnesses'] ?? "";
    allergicto = json['allergicTo'] ?? "";
   
  }
}
