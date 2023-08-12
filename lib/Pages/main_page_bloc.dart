import 'package:bug_trucker/DataTypes/bug.dart';
import 'package:bug_trucker/DataTypes/completion_status.dart';

class MainPageBloc {
  final List<Bug> _itemList = [Bug(1, 'bug', DateTime.now(), CompletionStatus.completed, 'John Arbuckle', 'https://picsum.photos/250?image=9', 'there is problem')];

  Future<List<Bug>> getItems() async {
    //TODO: ADD DATABASE STUFF HERE
    return _itemList;
  }

  void markBugAsCompleted(Bug bug) {
    //TODO PUT CODE HERE
  }

  void createNewBug(Bug bug) {
    _itemList.add(bug);
  }
}
