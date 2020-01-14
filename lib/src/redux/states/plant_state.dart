import 'package:plantpedia/src/models/plant_model.dart';

class PlantState {
  final List<PlantModel> plants;
  final PlantModel plant;

  PlantState({this.plants, this.plant});

  PlantState copy({
    List<PlantModel> plants,
    PlantModel plant,
  }) {
    return PlantState(
      plants: plants ?? this.plants,
      plant: plant ?? this.plant,
    );
  }

  factory PlantState.initialState() => PlantState(plants: [], plant: null);
}
