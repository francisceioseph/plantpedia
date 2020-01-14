class PlantImageModel {
  String url;

  PlantImageModel({this.url});

  PlantImageModel.fromJson(Map<String, dynamic> json) : url = json['url'];

  static List<PlantImageModel> arrayFromJson(List<dynamic> json) {
    return json.map((image) => PlantImageModel.fromJson(image)).toList();
  }
}
