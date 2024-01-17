import 'package:bug_trucker/DataTypes/bug.dart';
import 'package:bug_trucker/DataTypes/completion_status.dart';

import '../../DataTypes/comment.dart';

abstract class BugInfoEvent {}

class UpdateCommentsEvent extends BugInfoEvent {
  UpdateCommentsEvent(this.comments);

  final Iterable<Comment> comments;
}

class UpdateBugStatus extends BugInfoEvent {
  UpdateBugStatus(this.status);

  final CompletionStatus status;
}
