import 'package:bug_trucker/DataTypes/bug.dart';
import 'package:bug_trucker/DataTypes/color_schemes.dart';
import 'package:bug_trucker/Dialogs/add_bug_dialog.dart';
import 'package:bug_trucker/Pages/bug_info_page/bug_info_page.dart';
import 'package:bug_trucker/Pages/main_page/main_page_bloc.dart';
import 'package:bug_trucker/Widgets/bug_cell_list.dart';
import 'package:bug_trucker/model_theme.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // final SettingsPageBloc _bloc = SettingsPageBloc();
  ModelTheme modelTheme = ModelTheme();
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

        children: [
          Text('App theme: '),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => _changeTheme(ColorSchemes.blue),
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 50,
                ),
              ),
              InkWell(
                onTap: () => _changeTheme(ColorSchemes.red),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 50,
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => _changeTheme(ColorSchemes.green),
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 50,
                ),
              ),
              InkWell(
                onTap: () => _changeTheme(ColorSchemes.gloriousPurple),
                child: CircleAvatar(
                  backgroundColor: Colors.purple,
                  radius: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _changeTheme(ColorSchemes scheme) {
    modelTheme.changeTheme(scheme);
  }
}
