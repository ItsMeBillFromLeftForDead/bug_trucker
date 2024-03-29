import 'package:bug_trucker/DataTypes/bug.dart';
import 'package:bug_trucker/DataTypes/completion_status.dart';

import '../../DataTypes/comment.dart';

class BugInformationPageBloc {
  final List<Comment> _itemList = [
    Comment(1, 1, DateTime.now(), 'John Arbuckle',
        'https://picsum.photos/250?image=9', 'You should fix it'),
    Comment(1, 1, DateTime.now(), 'Sisyphus',
        'https://cdn.discordapp.com/attachments/543086710901178379/1138181008798261368/hbrxqet5lxfb1.jpg', 'Need to add a login page next')
  ];

  Future<List<Comment>> getComments() async {
    //TODO: ADD DATABASE STUFF HERE
    return _itemList;
  }

  void markBugAsCompleted(Bug bug) {
    //TODO PUT CODE HERE
  }

  void createNewComment(Comment comment) {
    _itemList.add(comment);
  }
}
