import 'package:plantpedia/src/models/plant_model.dart';

class PlantState {
  final List<PlantModel> plants;

  PlantState({this.plants});

  PlantState copy({List<PlantModel> plants}) {
    return PlantState(
      plants: plants ?? this.plants,
    );
  }

  factory PlantState.initialState() => PlantState(plants: []);
}
