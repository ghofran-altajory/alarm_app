class CardContinerModule {
  String? title;
  String? type;
  String? dec;
  String? date;
  String? time;
  CardContinerModule({this.title, this.dec, this.date, this.time});

  CardContinerModule.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "";
    type = json['type'] ?? "";
    dec = json['dec'] ?? "";
    date = json['date'] ?? "";
    time = json['time'] ?? "";
  }
}
