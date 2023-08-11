import 'package:bug_trucker/DataTypes/bug.dart';
import 'package:bug_trucker/Widgets/bug_cell.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ItemCellList extends StatelessWidget {
  const ItemCellList({required this.onTap, Key? key, required this.itemList, required this.isCartCell})
      : super(key: key);

  final Function onTap;
  final List<Bug> itemList;
  final bool isCartCell;

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        Bug item = itemList[index];
        return ItemCell(
          item: item,
          onTap: onTap,
          isCartCell: isCartCell,
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.black54,
          height: 8,
          thickness: 1,
          indent: 16,
          endIndent: 16,
        );
      },
    );
  }
}
