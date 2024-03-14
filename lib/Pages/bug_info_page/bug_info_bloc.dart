import 'package:bloc/bloc.dart';
import 'package:bug_trucker/Pages/bug_info_page/bug_info_event.dart';
import 'package:bug_trucker/Pages/bug_info_page/bug_info_state.dart';

class BugInfoBloc extends Bloc<BugInfoEvent, BugInfoState> {
  BugInfoBloc()
      : super(BugInfoState(comments: demoComments)) {
  }
}
