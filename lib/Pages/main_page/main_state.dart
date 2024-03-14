import 'package:bug_trucker/DataTypes/bug.dart';

class MainState {
  MainState({
    required this.bugs,
  });

  final List<Bug> bugs;

  void createNewBug(Bug bug) {
    bugs.add(bug);
  }

  void markBugAsCompleted(Bug bug) {
    //TODO PUT CODE HERE
  }

  MainState copyWith({
    List<Bug>? bugs,
  }) =>
      MainState(
        bugs: bugs ?? this.bugs,
      );
}
