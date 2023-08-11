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
    // `   final sound = switch (pet) {
    //        (Dog d) => '${d.name}: Woof!',
    //    (Cat c) => '${c.name}: Meow!',
    //    };`
    //    var dayNumber = switch (dayOfWeek) {
    //    'Monday' => 1,
    //    'Tuesday' => 2,
    //    'Wednesday' => 3,
    //    'Thursday' => 4,
    //    'Friday' => 5,
    //    'Saturday' => 6,
    //    'Sunday' => 7,
    //    _ => 10, //Default value
    //    };

    // Color barColor = ;
    return Card(
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
                    child: Image.network(
                      item.image!,
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
          Container(
            // height: 42.0,
            width: 2.0,
            color: switch (item.status) {
    CompletionStatus.completed => Colors.green,
    CompletionStatus.inProgress => Colors.orange,
    CompletionStatus.incomplete => Colors.red,
    _ => Colors.red,
    },
          )
        ],
      ),
    );
  }
}
