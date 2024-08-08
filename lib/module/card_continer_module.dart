class CardContinerModule {
  String? title;
  String? type;
  String? dec;
  String? date;
  String? time;
  bool? isFinsh;
  CardContinerModule(
      {this.title, this.dec, this.date, this.time, this.isFinsh});

  CardContinerModule.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "";
    type = json['type'] ?? "";
    dec = json['dec'] ?? "";
    date = json['date'] ?? "";
    time = json['time'] ?? "";
    isFinsh = json['isFinsh'] ?? false;
  }
}
