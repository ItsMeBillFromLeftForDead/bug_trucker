import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DataTypes/comment.dart';
import '../Widgets/comment_cell_list.dart';
import 'bug_information_page_bloc.dart';

class BugInformationPage extends StatefulWidget {
  BugInformationPage({Key? key}) : super(key: key);

  @override
  State<BugInformationPage> createState() => _BugInformationPageState();
}

class _BugInformationPageState extends State<BugInformationPage> {
  final BugInformationPageBloc _bloc = BugInformationPageBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('COOL BUG FACTS'),
            actions: [
              IconButton(
                  onPressed: () => print(''), icon: Icon(Icons.view_headline))
            ],
          ),
          body: StreamBuilder<List<Comment>>(
              initialData: [],
              stream: Stream.fromFuture(_bloc.getComments()),
              builder: (context, snapshot) {
                return CommentCellList(
                  itemList: snapshot.requireData,
                );
              }),
        ));
  }
}