import 'package:bug_trucker/DataTypes/bug.dart';
import 'package:bug_trucker/Dialogs/add_bug_dialog.dart';
import 'package:bug_trucker/Pages/bug_information_page.dart';
import 'package:bug_trucker/Pages/main_page_bloc.dart';
import 'package:bug_trucker/Pages/settings_page.dart';
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
    //TODO: add logged in user data here when that becomes availible
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text(
        'John Arbuckle',
      ),
      accountEmail: Text(
        'johnarbuckle@hotmale.com',
      ),
      currentAccountPicture: CircleAvatar(
        child: FadeInImage.assetNetwork(
          imageErrorBuilder: (context, error, StackTrace) {
            return const Image(
                image:
                AssetImage('assets/place_holder.png'));
          },
          placeholder: 'assets/place_holder.png',
          image: 'https://picsum.photos/250?image=9',
        ),
      ),
    );
    final drawerItems = ListView(
      children: [
        drawerHeader,
        ListTile(
          title: Text(
            'Settings',
          ),
          leading: const Icon(Icons.settings),
          onTap: _pushSettingsPage,
        ),
      ],
    );
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
      endDrawer:  Drawer(child: drawerItems,),
      appBar: AppBar(
        title: Text('COOL BUG FACTS'),
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

  _pushSettingsPage() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SettingsPage())).then((value) => setState(() {}));
  }

  _showAddBugDialog() {
    showDialog(
            context: context,
            builder: (context) => CreateBugDialog(onCreate: _bloc.createNewBug))
        .then((value) => setState(() {}));
  }
}
