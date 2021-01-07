//import 'package:Chat_App_UI/Models/user_model.dart';

import 'package:Hunarmand_signIn_Ui/Models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool islinked;
  final bool unread;

  Message({this.sender, this.time, this.text, this.islinked, this.unread});
}

final User currentuser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/greg.jpg',
);

final User james = User(
  id: 1,
  name: 'james',
  imageUrl: 'assets/images/james.jpg',
);

final User john = User(
  id: 2,
  name: 'john',
  imageUrl: 'assets/images/john.jpg',
);

final User olivia = User(
  id: 3,
  name: 'olivia',
  imageUrl: 'assets/images/olivia.jpg',
);

final User sam = User(
  id: 4,
  name: 'sam',
  imageUrl: 'assets/images/sam.jpg',
);

final User sophia = User(
  id: 5,
  name: 'sophia',
  imageUrl: 'assets/images/sophia.jpg',
);

final User steven = User(
  id: 6,
  name: 'steven',
  imageUrl: 'assets/images/steven.jpg',
);

List<User> favrites = [john, steven, olivia, sam, steven];

List<Message> chats = [
  Message(
    sender: james,
    time: "5:30 PM",
    text: "Hii buddy how are you",
    islinked: false,
    unread: true,
  ),
  Message(
    sender: sophia,
    time: "5:30 PM",
    text: "Hii buddy how are you",
    islinked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: "9:30 PM",
    text: "Hii buddy how are you",
    islinked: true,
    unread: false,
  ),
  Message(
    sender: john,
    time: "8:30 PM",
    text: "Hii buddy how are you",
    islinked: false,
    unread: false,
  ),
  Message(
    sender: olivia,
    time: "7:30 PM",
    text: "Hii buddy how are you",
    islinked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: "6:30 PM",
    text: "Hii buddy how are you",
    islinked: false,
    unread: false,
  ),
];
List<Message> messages = [
  Message(
    sender: currentuser,
    time: "5:30 PM",
    text: "Hii buddy how are you",
    islinked: false,
    unread: true,
  ),
  Message(
    sender: sophia,
    time: "4:30 PM",
    text: "hellow i m fine what about you",
    islinked: true,
    unread: true,
  ),
  Message(
    sender: currentuser,
    time: "9:30 PM",
    text: "What's going on buddy",
    islinked: true,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: "8:30 PM",
    text: "Nothing special just reading a book what about you",
    islinked: false,
    unread: false,
  ),
  Message(
    sender: currentuser,
    time: "7:30 PM",
    text: "I am doning an assingment and stuck on it",
    islinked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: "6:30 PM",
    text: "Oh! which type of assingment ,may i help you",
    islinked: false,
    unread: false,
  ),
];
