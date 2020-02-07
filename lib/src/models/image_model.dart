class ImageModel {
  String url;

  ImageModel({this.url});

  ImageModel.fromJson(Map<String, dynamic> json) : url = json['url'];

  static List<ImageModel> arrayFromJson(List<dynamic> json) {
    return json.map((image) => ImageModel.fromJson(image)).toList();
  }
}
