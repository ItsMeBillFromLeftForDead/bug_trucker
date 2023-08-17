import 'package:bug_trucker/DataTypes/bug.dart';
import 'package:bug_trucker/Dialogs/add_bug_dialog.dart';
import 'package:bug_trucker/Pages/bug_information_page.dart';
import 'package:bug_trucker/Pages/main_page_bloc.dart';
import 'package:bug_trucker/Widgets/bug_cell_list.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainPageBloc _bloc = MainPageBloc();

  @override
  Widget build(BuildContext context) {
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
                  Text('New Bug'),
                ],
              ),
              onPressed: _showAddBugDialog,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('COOL BUG FACTS'),
        actions: [
          IconButton(
              onPressed: () => print(''), icon: Icon(Icons.view_headline))
        ],
      ),
      body: StreamBuilder<List<Bug>>(
          initialData: [],
          stream: Stream.fromFuture(_bloc.getItems()),
          builder: (context, snapshot) {
            return ItemCellList(
              itemList: snapshot.requireData,
              onTap: _pushBugInformationPage,
            );
          }),
    );
  }

  _pushBugInformationPage(Bug bug) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => BugInformationPage(bug: bug))).then((value) => setState(() {}));
  }

  _showAddBugDialog() {
    showDialog(
            context: context,
            builder: (context) => CreateBugDialog(onCreate: _bloc.createNewBug))
        .then((value) => setState(() {}));
  }
}
