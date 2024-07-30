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
    bloodtype = json['blood type'] ?? "";
    weight = json['weight'] ?? "";
    long = json['long'] ?? "";
    currentdrugs = json['current drugs'] ?? "";
    vaccines = json['vaccines'] ?? "";
    chronicdisease = json['chronic disease'] ?? "";
    seriousillnesses = json['serious illnesses'] ?? "";
    priorsurgery = json['prior surgery'] ?? "";
    familyillness = json['Family Illness'] ?? "";
    otherillnesses = json['other illnesses'] ?? "";
    allergicto = json['allergic to'] ?? "";
   
  }
}
