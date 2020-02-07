import 'package:equatable/equatable.dart';
import 'package:plantpedia/src/models/image_model.dart';

class SpeciesModel extends Equatable {
  final int id;
  final String scientificName;
  final String commonName;
  final String nativeStatus;
  final String description;
  final List<ImageModel> images;

  SpeciesModel({
    this.id,
    this.scientificName,
    this.commonName,
    this.nativeStatus,
    this.images,
    this.description,
  });

  SpeciesModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        scientificName = json['scientific_name'] ?? '',
        commonName = json['common_name'] ?? '',
        nativeStatus = json['native_status'] ?? '',
        description = json['description'],
        images = ImageModel.arrayFromJson(json['species_images'] ?? []);

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
