class EditAds {
  String? singleprice;
  String? weekprice;
  String? monthprice;
  String? yearprice;

  EditAds({
    this.singleprice,
    this.weekprice,
    this.monthprice,
    this.yearprice,
  });

  EditAds.fromJson(Map<String, dynamic> json) {
    singleprice = json['singleprice'] ?? "";
    weekprice = json['weekprice'] ?? "";
    monthprice = json['monthprice'] ?? "";
    yearprice = json['yearprice'] ?? "";
  }
}
