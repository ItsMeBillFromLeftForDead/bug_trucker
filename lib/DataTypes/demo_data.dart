import 'package:bug_trucker/DataTypes/comment.dart';

import 'bug.dart';
import 'completion_status.dart';

final demoComments = [
  Comment(1, 1, DateTime.now(), 'John Arbuckle',
      'https://picsum.photos/250?image=9', 'You should fix it'),
  Comment(2, 1, DateTime.now(), 'Sisyphus',
      'https://cdn.discordapp.com/attachments/543086710901178379/1138181008798261368/hbrxqet5lxfb1.jpg', 'mm big rock'),
  Comment(3, 1, DateTime.now(), 'King Minos',
      'https://picsum.photos/250?image=9', 'Here is a really long monologue for the purpose of testing wether or not you have properly made it so that text wraps correctly, muahahahahhahahahahahahhahhahahahahahahah. alright that should do it'),
  Comment(4, 1, DateTime.now(), 'King Midas',
      'https://picsum.photos/250?image=9', 'Oh bother'),
  Comment(5, 2, DateTime.now(), 'Atilla the Hun',
      'https://picsum.photos/250?image=9', 'Lorem'),
  Comment(6, 2, DateTime.now(), 'Vlad the impaler',
      'https://picsum.photos/250?image=9', 'Ipsum'),
  Comment(7, 2, DateTime.now(), 'Ghengis Khan',
      'https://picsum.photos/250?image=9', 'Dolor'),
  Comment(8, 2, DateTime.now(), 'Dracula',
      'https://picsum.photos/250?image=9', ''), //nothing here for test purposes
  Comment(9, 3, DateTime.now(), 'Callahan',
      'https://picsum.photos/250?image=9', 'Hey its me!'),
  Comment(10, 3, DateTime.now(), 'Aaron',
      'https://picsum.photos/250?image=9', 'something'),
  Comment(11, 3, DateTime.now(), 'Steve',
      'https://picsum.photos/250?image=9', 'idk im running out of things to put in these'),
  Comment(12, 3, DateTime.now(), 'Bob',
      'https://picsum.photos/250?image=9', 'Bob'),
];

final demoBugs = [
  Bug(1, 'BUG-001', DateTime.now(), CompletionStatus.completed, 'John Arbuckle', 'https://picsum.photos/250?image=9', 'there is problem'),
  Bug(2, 'BUG-002', DateTime.now(), CompletionStatus.completed, 'John Arbuckle', 'https://picsum.photos/250?image=9', 'lorum ipsum left in app'),
  Bug(3, 'BUG-003', DateTime.now(), CompletionStatus.completed, 'John Arbuckle', 'https://picsum.photos/250?image=9', 'Add backend database instead of using demo data'),
];