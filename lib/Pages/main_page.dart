import 'package:bug_trucker/DataTypes/bug.dart';
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
    return MaterialApp(
        home: Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          children: [
            Spacer(),
            ElevatedButton(
              child: Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add),
                    Text('New Bug'),
                  ],
                ),
              ),
              onPressed: () {},
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
              isCartCell: false,
              itemList: snapshot.requireData,
              onTap: (item) {},
            );
          }),
    ));
  }
}
