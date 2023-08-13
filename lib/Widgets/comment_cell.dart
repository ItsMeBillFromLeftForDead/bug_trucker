import 'package:bug_trucker/DataTypes/bug.dart';
import 'package:bug_trucker/DataTypes/completion_status.dart';
import 'package:flutter/material.dart';

import '../DataTypes/comment.dart';

class CommentCell extends StatelessWidget {
  const CommentCell({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Comment item;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: IntrinsicHeight(
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.poster!,
                  textAlign: TextAlign.left,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/place_holder.png',
                        image: item.posterImage!,
                        height: 40,
                        width: 40,
                      ),
                    ),
                    Text(item.description!),
                    Text(item.postedDate!.toString()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
