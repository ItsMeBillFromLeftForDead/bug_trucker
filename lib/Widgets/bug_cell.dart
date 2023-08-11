import 'package:bug_trucker/DataTypes/bug.dart';
import 'package:flutter/material.dart';

class ItemCell extends StatelessWidget {
  const ItemCell({
    Key? key,
    required this.item,
    required this.onTap,
    required this.isCartCell,
  }) : super(key: key);
  final Bug item;
  final Function onTap;
  final bool isCartCell;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            child: Image.network(item.image!),
            height: 100,
            width: 100,
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title!,
                  textAlign: TextAlign.left,
                ),
                if (!isCartCell)
                  ElevatedButton(
                      onPressed: () => onTap.call(item), child: Text('Add to Cart')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
