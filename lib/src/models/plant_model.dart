import 'package:equatable/equatable.dart';
import 'package:plantpedia/src/models/plant_image_model.dart';

class PlantModel extends Equatable {
  final int id;
  final String scientificName;
  final String commonName;
  final String nativeStatus;
  final String description;
  final List<PlantImageModel> images;

  PlantModel({
    this.id,
    this.scientificName,
    this.commonName,
    this.nativeStatus,
    this.images,
    this.description,
  });

  PlantModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        scientificName = json['scientific_name'] ?? '',
        commonName = json['common_name'] ?? '',
        nativeStatus = json['native_status'] ?? '',
        description = json['description'],
        images = PlantImageModel.arrayFromJson(json['species_images'] ?? []);

  @override
  List<Object> get props => [
        id,
        scientificName,
        commonName,
        nativeStatus,
        description,
        images,
      ];
}
