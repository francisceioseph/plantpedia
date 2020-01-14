import 'package:async_redux/async_redux.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';

final store = Store<AppState>(
  initialState: AppState.initial(),
);
