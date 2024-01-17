import 'package:bug_trucker/DataTypes/bug.dart';
import 'package:bug_trucker/Dialogs/add_bug_dialog.dart';
import 'package:bug_trucker/Pages/bug_info_page/bug_info_bloc.dart';
import 'package:bug_trucker/Pages/bug_info_page/bug_info_page.dart';
import 'package:bug_trucker/Pages/main_page/main_bloc.dart';
import 'package:bug_trucker/Pages/main_page/main_page_bloc.dart';
import 'package:bug_trucker/Pages/settings_page.dart';
import 'package:bug_trucker/Widgets/bug_cell_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_event.dart';
import 'main_state.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final MainBloc mainBloc = BlocProvider.of<MainBloc>(context);

    //TODO: add logged in user data here when that becomes available
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
            return const Image(image: AssetImage('assets/place_holder.png'));
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
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) =>  CreateBugDialog(
                      onCreate: mainBloc.state.createNewBug,
                    ),
                ).then((value) => setState(() {}));
              },
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: drawerItems,
      ),
      appBar: AppBar(
        title: Text('COOL BUG FACTS'),
      ),
      body: BlocBuilder<MainBloc, MainState>(
          bloc: mainBloc,
          builder: (context, snapshot) {
            return ItemCellList(
              itemList: snapshot.bugs,
              onTap: _pushBugInformationPage,
            );
          }),
    );
  }

  _pushBugInformationPage(Bug bug) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => BlocProvider<BugInfoBloc>(
              create: (BuildContext context) => BugInfoBloc(),
              child: BugInformationPage(bug: bug),
            ),
          ),
        )
        .then((value) => setState(() {}));
  }

  _pushSettingsPage() {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => SettingsPage(),
          ),
        )
        .then((value) => setState(() {}));
  }
}
