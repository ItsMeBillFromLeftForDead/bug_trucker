import 'package:bug_trucker/DataTypes/completion_status.dart';
import 'package:bug_trucker/Dialogs/add_comment_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DataTypes/bug.dart';
import '../DataTypes/comment.dart';
import '../Widgets/comment_cell_list.dart';
import 'bug_information_page_bloc.dart';

class BugInformationPage extends StatefulWidget {
  BugInformationPage({Key? key, required this.bug}) : super(key: key);

  final Bug bug;

  @override
  State<BugInformationPage> createState() => _BugInformationPageState();
}

class _BugInformationPageState extends State<BugInformationPage> {
  final BugInformationPageBloc _bloc = BugInformationPageBloc();

  @override
  Widget build(BuildContext context) {
    CompletionStatus dropdownValue = widget.bug.status!;

    return Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: Row(
              children: [
                Spacer(),
                ElevatedButton(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add),
                      Text('New Comment'),
                    ],
                  ),
                  onPressed: _showAddCommentDialog,
                ),
              ],
            ),
          ),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.bug.title!),
      ),
      body: Column(
        children: [
          Card(
            child: DropdownButton<CompletionStatus>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (CompletionStatus? value) {
                setState(() {
                  dropdownValue = value!;
                  widget.bug.status = value;
                });
              },
              items: CompletionStatus.values
                  .map<DropdownMenuItem<CompletionStatus>>(
                      (CompletionStatus value) {
                switch (value) {
                  case CompletionStatus.completed:
                    return DropdownMenuItem<CompletionStatus>(
                      value: value,
                      child: Text('Completed'),
                    );
                  case CompletionStatus.inProgress:
                    return DropdownMenuItem<CompletionStatus>(
                      value: value,
                      child: Text('In Progress'),
                    );
                  case CompletionStatus.incomplete:
                    return DropdownMenuItem<CompletionStatus>(
                      value: value,
                      child: Text('Incomplete'),
                    );
                }
              }).toList(),
            ),
          ),
          Card(
            child: Row(
              children: [
                Text('Reporter: ${widget.bug.reporter}'),
                Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/place_holder.png',
                    image: widget.bug.image!,
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
          Text(widget.bug.description!),
          Spacer(),
          Expanded(
            child: StreamBuilder<List<Comment>>(
                initialData: [],
                stream: Stream.fromFuture(_bloc.getComments()),
                builder: (context, snapshot) {
                  return CommentCellList(
                    itemList: snapshot.requireData,
                  );
                }),
          ),
        ],
      ),
    );
  }
  
  _showAddCommentDialog() {
    showDialog(
        context: context,
        builder: (context) =>
            AddCommentDialog(onCreate: _bloc.createNewComment, bug: widget.bug,))
        .then((value) => setState(() {}));
  }
}
