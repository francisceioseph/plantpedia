import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:plantpedia/src/plantpedia.dart';

void main() async {
  await DotEnv().load('environments/.env');
  runApp(PlantPedia());
}
