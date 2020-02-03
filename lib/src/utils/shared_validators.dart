import 'package:plantpedia/src/constants.dart';

class SharedValidators {
  static bool validateEmail(String value) {
    final regex = RegExp(kEmailRegex);
    return regex.hasMatch(value);
  }
}
