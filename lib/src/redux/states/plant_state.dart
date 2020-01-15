import 'package:plantpedia/src/models/plant_model.dart';

class PlantState {
  final Map<String, PlantModel> basicPlants;
  final Map<String, PlantModel> plants;

  final PlantModel plant;

  PlantState({this.basicPlants, this.plants, this.plant});

  PlantState copy({
    final Map<String, PlantModel> basicPlants,
    final Map<String, PlantModel> plants,
    PlantModel plant,
  }) {
    return PlantState(
      basicPlants: basicPlants ?? this.basicPlants,
      plants: plants ?? this.plants,
      plant: plant ?? this.plant,
    );
  }

  factory PlantState.initialState() => PlantState(
        basicPlants: Map<String, PlantModel>(),
        plants: Map<String, PlantModel>(),
        plant: null,
      );
}
