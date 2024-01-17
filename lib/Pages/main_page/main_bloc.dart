import 'package:bloc/bloc.dart';
import 'package:bug_trucker/DataTypes/demo_data.dart';

import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc()
      : super(MainState(bugs: demoBugs)) {
  }
}
