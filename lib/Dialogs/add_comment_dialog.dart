import 'package:bug_trucker/DataTypes/bug.dart';
import 'package:bug_trucker/DataTypes/completion_status.dart';
import 'package:flutter/material.dart';

import '../DataTypes/comment.dart';

class AddCommentDialog extends StatelessWidget {
  const AddCommentDialog({
    Key? key,
    required this.onCreate,
    required this.bug,
  }) : super(key: key);
  final Function(Comment) onCreate;
  final Bug bug;

  @override
  Widget build(BuildContext context) {
    TextEditingController titleEditingController = TextEditingController();
    TextEditingController descriptionEditingController =
    TextEditingController();
    return AlertDialog(
      title: const Text('Post a comment'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Row(
              children: [
                Text('Description: '),
                Flexible(
                  child: TextField(
                    controller: descriptionEditingController,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Close'),
        ),
        TextButton(
          onPressed: () {
            onCreate.call(Comment(
                1,
                bug.id,
                DateTime.now(),
                'reporter',
                'image',
                descriptionEditingController.text));
            Navigator.of(context).pop();
          },
          child: Text('Create'),
        ),
      ],
    );
  }
}
