import 'package:bug_trucker/DataTypes/bug.dart';

class MainPageBloc {
  final List<Bug> _itemList = [];

  Future<List<Bug>> getItems() async {
    //TODO: ADD DATABASE STUFF HERE
    return _itemList;
  }

  void markBugAsCompleted(Bug item) {
    //TODO PUT CODE HERE
  }
}
