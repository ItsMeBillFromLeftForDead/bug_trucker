import '../../DataTypes/bug.dart';
import '../../DataTypes/comment.dart';

class BugInfoState {
  BugInfoState({
    required this.comments,
  });

  final List<Comment> comments;

  void markBugAsCompleted(Bug bug) {
    //TODO PUT CODE HERE
  }

  void createNewComment(Comment comment) {
    comments.add(comment);
  }

  BugInfoState copyWith({
    List<Comment>? comments,
  }) =>
      BugInfoState(
        comments: comments ?? this.comments,
      );
}
