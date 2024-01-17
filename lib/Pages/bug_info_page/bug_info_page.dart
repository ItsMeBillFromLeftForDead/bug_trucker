import 'package:bug_trucker/DataTypes/completion_status.dart';
import 'package:bug_trucker/Dialogs/add_comment_dialog.dart';
import 'package:bug_trucker/Pages/bug_info_page/bug_info_bloc.dart';
import 'package:bug_trucker/Pages/bug_info_page/bug_info_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../DataTypes/bug.dart';
import '../../DataTypes/comment.dart';
import '../../Widgets/comment_cell_list.dart';
import 'bug_information_page_bloc.dart';

class BugInformationPage extends StatefulWidget {
  BugInformationPage({Key? key, required this.bug}) : super(key: key);

  final Bug bug;

  @override
  State<BugInformationPage> createState() => _BugInformationPageState();
}

class _BugInformationPageState extends State<BugInformationPage> {
  @override
  Widget build(BuildContext context) {
    CompletionStatus dropdownValue = widget.bug.status!;
    final BugInfoBloc bugBloc = BlocProvider.of<BugInfoBloc>(context);

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Spacer(),
            ElevatedButton(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.add),
                  Text('New Comment'),
                ],
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddCommentDialog(
                    onCreate: bugBloc.state.createNewComment,
                    bug: widget.bug,
                  ),
                ).then((value) => setState(() {}));
              },
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
            child: Column(
              children: [
                DropdownButton<CompletionStatus>(
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Reporter: '),
                    // Spacer(),
                    Text(widget.bug.reporter!),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(8.0),
                    //   child: FadeInImage.assetNetwork(
                    //     imageErrorBuilder: (context, error, StackTrace) {
                    //       return const Image(
                    //           height: 40,
                    //           width: 40,
                    //           image:
                    //           AssetImage('assets/place_holder.png'));
                    //     },
                    //     placeholder: 'assets/place_holder.png',
                    //     image: widget.bug.image!,
                    //     height: 40,
                    //     width: 40,
                    //   ),
                    // ),
                  ],
                ),
                Text(widget.bug.description!),
              ],
            ),
          ),
          Divider(
            height: 20,
            thickness: 5,
            color: Colors.black,
            indent: 10,
            endIndent: 10,
          ),
          Expanded(
            child: BlocBuilder<BugInfoBloc, BugInfoState>(
                bloc: bugBloc,
                builder: (context, snapshot) {
                  return CommentCellList(
                    itemList: snapshot.comments,
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
        builder: (context) => BlocProvider.value(
            value: BlocProvider.of<BugInfoBloc>(context),
            child: AddCommentDialog(
              onCreate:
                  BlocProvider.of<BugInfoBloc>(context).state.createNewComment,
              bug: widget.bug,
            ))).then((value) => setState(() {}));
  }
}
