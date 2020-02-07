import 'package:plantpedia/src/models/species_model.dart';

class SpeciesState {
  final Map<String, SpeciesModel> speciesIds;
  final Map<String, SpeciesModel> species;

  final SpeciesModel plant;

  SpeciesState({this.speciesIds, this.species, this.plant});

  SpeciesState copy({
    final Map<String, SpeciesModel> speciesIds,
    final Map<String, SpeciesModel> speciesMap,
    SpeciesModel plant,
  }) {
    return SpeciesState(
      speciesIds: speciesIds ?? this.speciesIds,
      species: speciesMap ?? this.species,
      plant: plant ?? this.plant,
    );
  }

  factory SpeciesState.initialState() => SpeciesState(
        speciesIds: Map<String, SpeciesModel>(),
        species: Map<String, SpeciesModel>(),
        plant: null,
      );
}
