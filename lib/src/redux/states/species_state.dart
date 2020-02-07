import 'package:plantpedia/src/models/species_model.dart';

class SpeciesState {
  final Map<String, SpeciesModel> speciesIds;
  final Map<String, SpeciesModel> speciesMap;

  final SpeciesModel species;

  SpeciesState({this.speciesIds, this.speciesMap, this.species});

  SpeciesState copy({
    final Map<String, SpeciesModel> speciesIds,
    final Map<String, SpeciesModel> speciesMap,
    SpeciesModel species,
  }) {
    return SpeciesState(
      speciesIds: speciesIds ?? this.speciesIds,
      speciesMap: speciesMap ?? this.speciesMap,
      species: species ?? this.species,
    );
  }

  factory SpeciesState.initialState() => SpeciesState(
        speciesIds: Map<String, SpeciesModel>(),
        speciesMap: Map<String, SpeciesModel>(),
        species: null,
      );
}
