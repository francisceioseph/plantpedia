import 'package:equatable/equatable.dart';
import 'package:plantpedia/src/models/plant_image_model.dart';

class PlantModel extends Equatable {
  final int id;
  final String scientificName;
  final String commonName;
  final String nativeStatus;
  final List<PlantImageModel> images;

  PlantModel({
    this.id,
    this.scientificName,
    this.commonName,
    this.nativeStatus,
    this.images,
  });

  PlantModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        scientificName = json['scientific_name'],
        commonName = json['common_name'],
        nativeStatus = json['native_status'],
        images = PlantImageModel.arrayFromJson(json['images']);

  @override
  List<Object> get props =>
      [id, scientificName, commonName, nativeStatus, images];
}
