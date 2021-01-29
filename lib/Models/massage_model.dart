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
  imageUrl: 'assets/userimages/user1.png',
);

final User hamad = User(
  id: 1,
  name: 'Hammad',
  imageUrl: 'assets/userimages/user2.png',
);

final User ali = User(
  id: 2,
  name: 'Ali',
  imageUrl: 'assets/userimages/user3.png',
);

final User adeel = User(
  id: 3,
  name: 'Adeel',
  imageUrl: 'assets/userimages/user4.png',
);

final User jawad = User(
  id: 4,
  name: 'Jawad',
  imageUrl: 'assets/userimages/user5.png',
);

final User mubeen = User(
  id: 5,
  name: 'Mubeen',
  imageUrl: 'assets/userimages/user6.png',
);

final User haroon = User(
  id: 6,
  name: 'haroon',
  imageUrl: 'assets/userimages/user1.png',
);

List<User> favrites = [ali, jawad, mubeen, adeel, haroon];

List<Message> chats = [
  Message(
    sender: ali,
    time: "5:30 PM",
    text: "Hii buddy how are you",
    islinked: false,
    unread: true,
  ),
  Message(
    sender: hamad,
    time: "5:30 PM",
    text: "Hii buddy how are you",
    islinked: false,
    unread: true,
  ),
  Message(
    sender: mubeen,
    time: "9:30 PM",
    text: "Hii buddy how are you",
    islinked: true,
    unread: false,
  ),
  Message(
    sender: adeel,
    time: "8:30 PM",
    text: "Hii buddy how are you",
    islinked: false,
    unread: false,
  ),
  Message(
    sender: jawad,
    time: "7:30 PM",
    text: "Hii buddy how are you",
    islinked: false,
    unread: false,
  ),
  Message(
    sender: haroon,
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
    sender: ali,
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
    sender: hamad,
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
    sender: adeel,
    time: "6:30 PM",
    text: "Oh! which type of assingment ,may i help you",
    islinked: false,
    unread: false,
  ),
];
