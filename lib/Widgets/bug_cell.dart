import 'package:bug_trucker/DataTypes/bug.dart';
import 'package:bug_trucker/DataTypes/completion_status.dart';
import 'package:flutter/material.dart';

class ItemCell extends StatelessWidget {
  const ItemCell({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);
  final Bug item;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Inkwell(
      onTap: onTap,
      child: Card(
        child: IntrinsicHeight(
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title!,
                    textAlign: TextAlign.left,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/place_holder.png',
                          image: item.image!,
                          height: 40,
                          width: 40,
                        ),
                      ),
                      Text(item.reporter!),
                      Text(item.postedDate!.toString()),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Container(
                height: double.infinity,
                width: 20.0,
                color: switch (item.status) {
                  CompletionStatus.completed => Colors.green,
                  CompletionStatus.inProgress => Colors.orange,
                  CompletionStatus.incomplete => Colors.red,
                  _ => Colors.red,
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
