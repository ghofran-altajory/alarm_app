class CardContinerModule {
  String? title;
  String? dec;
  String? date;
  String? time;
  CardContinerModule({this.title, this.dec, this.date, this.time});

  CardContinerModule.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "";
    dec = json['dec'] ?? "";
    date = json['date'] ?? "";
    time = json['time'] ?? "";
  }
}
