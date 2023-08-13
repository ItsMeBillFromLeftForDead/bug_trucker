import 'package:bug_trucker/DataTypes/bug.dart';
import 'package:bug_trucker/Widgets/comment_cell.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../DataTypes/comment.dart';

class CommentCellList extends StatelessWidget {
  const CommentCellList({Key? key, required this.itemList})
      : super(key: key);

  final List<Comment> itemList;

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        Comment item = itemList[index];
        return CommentCell(
          item: item,
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.black54,
          height: 8,
          thickness: 1,
          indent: 16,
          endIndent: 16,
        );
      },
    );
  }
}
