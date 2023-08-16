import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: FadeInImage.assetNetwork(
                        imageErrorBuilder: (context, error, StackTrace) {
                          return const Image(
                              height: 100,
                              width: 100,
                              image:
                              AssetImage('assets/place_holder.png'));
                        },
                        placeholder: 'assets/place_holder.png',
                        image: item.posterImage!,
                        height: 40,
                        width: 40,
                      ),
                    ),
                    Text(
                      ' ${item.poster!}',
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Text(item.description!),
                Text(DateFormat('yyyy-MM-dd – kk:mm').format(item.postedDate!)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
