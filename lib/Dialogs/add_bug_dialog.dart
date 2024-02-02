import 'package:bug_trucker/DataTypes/bug.dart';
import 'package:bug_trucker/DataTypes/completion_status.dart';
import 'package:flutter/material.dart';

class CreateBugDialog extends StatelessWidget {
  const CreateBugDialog({
    Key? key,
    required this.onCreate,
  }) : super(key: key);
  final Function(Bug) onCreate;

  @override
  Widget build(BuildContext context) {
    TextEditingController titleEditingController = TextEditingController();
    TextEditingController descriptionEditingController =
        TextEditingController();
    return AlertDialog(
      title: const Text('Create a new Bug'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Row(
              children: [
                Text('Title: '),
                Flexible(
                  child: TextField(
                    controller: titleEditingController,
                  ),
                ),
              ],
            ),
          ),
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
            onCreate.call(Bug(
                1,
                titleEditingController.text,
                DateTime.now(),
                CompletionStatus.incomplete,
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
