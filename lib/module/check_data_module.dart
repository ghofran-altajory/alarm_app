class CheckDataModule {
   String? title;
 
  CheckDataModule({
      this.title,
      
         });

  CheckDataModule.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "";
   
  }
}