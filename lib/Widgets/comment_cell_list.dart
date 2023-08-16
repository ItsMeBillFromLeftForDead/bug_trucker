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
    final ScrollController scrollController = ScrollController();
    return Scrollbar(
      controller: scrollController,
      thickness: 10,
      thumbVisibility: true,
      trackVisibility: true,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        controller: scrollController,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          Comment item = itemList[index];
          return CommentCell(
            item: item,
          );
        },
      ),
    );
  }
}
