from datetime import datetime

from sqlalchemy import DateTime

from models.bug import Bug
from models.comment import Comment

demoComments = [
  Comment(1, datetime.now(), 'John Arbuckle',
      'https://picsum.photos/250?image=9', 'You should fix it'),
  Comment(1, datetime.now(), 'Sisyphus',
      'https://cdn.discordapp.com/attachments/543086710901178379/1138181008798261368/hbrxqet5lxfb1.jpg', 'mm big rock'),
  Comment(1, datetime.now(), 'King Minos',
      'https://picsum.photos/250?image=9', 'Here is a really long monologue for the purpose of testing wether or not you have properly made it so that text wraps correctly, muahahahahhahahahahahahhahhahahahahahahah. alright that should do it'),
  Comment(1, datetime.now(), 'King Midas',
      'https://picsum.photos/250?image=9', 'Oh bother'),
  Comment(2, datetime.now(), 'Atilla the Hun',
      'https://picsum.photos/250?image=9', 'Lorem'),
  Comment(2, datetime.now(), 'Vlad the impaler',
      'https://picsum.photos/250?image=9', 'Ipsum'),
  Comment(2, datetime.now(), 'Ghengis Khan',
      'https://picsum.photos/250?image=9', 'Dolor'),
  Comment(2, datetime.now(), 'Dracula',
      'https://picsum.photos/250?image=9', ''),
  Comment(3, datetime.now(), 'Callahan',
      'https://picsum.photos/250?image=9', 'Hey its me!'),
  Comment(3, datetime.now(), 'Aaron',
      'https://picsum.photos/250?image=9', 'something'),
  Comment(3, datetime.now(), 'Steve',
      'https://picsum.photos/250?image=9', 'idk im running out of things to put in these'),
  Comment(3, datetime.now(), 'Bob',
      'https://picsum.photos/250?image=9', 'Bob'),
]

demoBugs = [
  Bug('BUG-001', datetime.now(), 'CompletionStatus.Incomplete', 'John Arbuckle', 'https://picsum.photos/250?image=9', 'there is problem'),
  Bug('BUG-002', datetime.now(), 'CompletionStatus.InProgress', 'John Arbuckle', 'https://picsum.photos/250?image=9', 'lorum ipsum left in app'),
  Bug('BUG-003', datetime.now(), 'CompletionStatus.Completed', 'John Arbuckle', 'https://picsum.photos/250?image=9', 'Add backend database instead of using demo data'),
]