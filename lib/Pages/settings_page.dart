import 'package:bug_trucker/DataTypes/bug.dart';
import 'package:bug_trucker/Dialogs/add_bug_dialog.dart';
import 'package:bug_trucker/Pages/bug_information_page.dart';
import 'package:bug_trucker/Pages/main_page_bloc.dart';
import 'package:bug_trucker/Widgets/bug_cell_list.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // final SettingsPageBloc _bloc = SettingsPageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: const [
          Text('App theme: '),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 50,
              ),
              CircleAvatar(
                radius: 50,
              ),
              CircleAvatar(
                radius: 50,
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 50,
              ),
              CircleAvatar(
                radius: 50,
              ),
              CircleAvatar(
                radius: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
