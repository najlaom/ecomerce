import 'package:ecomerce/models/model.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce/components/assets.dart';


class Event {
  final User sender;
  final String
  time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final String image;
  final String imageEvent;
  final bool isLiked;
  final bool unread;
  final String theme;

  Event(
      {this.sender,
        this.time,
        this.text,
        this.isLiked,
        this.unread,
        this.image,
        this.theme,
        this.imageEvent});
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/greg.jpg',
  imageEvent: imgevents[6],
);

// USERS
final User greg = User(
  id: 1,
  name: 'Greg',
  imageUrl: 'assets/images/greg.jpg',
  imageEvent: imgevents[7],
);
final User james = User(
  id: 2,
  name: 'James',
  imageUrl: 'assets/images/james.jpg',
  imageEvent: imgevents[0],
);
final User john = User(
  id: 3,
  name: 'John',
  imageUrl: 'assets/images/john.jpg',
  imageEvent: imgevents[3],
);
final User olivia = User(
  id: 4,
  name: 'Olivia',
  imageUrl: 'assets/images/olivia.jpg',
  imageEvent: imgevents[1],
);
final User sam = User(
  id: 5,
  name: 'Sam',
  imageUrl: 'assets/images/sam.jpg',
  imageEvent: imgevents[5],
);
final User sophia = User(
  id: 6,
  name: 'Sophia',
  imageUrl: 'assets/images/sophia.jpg',
  imageEvent: imgevents[4],
);
final User steven = User(
  id: 7,
  name: 'Steven',
  imageUrl: 'assets/images/steven.jpg',
  imageEvent: imgevents[5],
);

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Event> events = [
  Event(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
    image: 'assets/images/james.jpg',
    imageEvent: imgevents[0],
    theme: 'event',
  ),
  Event(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
    image: 'assets/images/olivia.jpg',
    imageEvent: imgevents[1],
    theme: 'event',
  ),
  Event(
    sender: john,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
    image: 'assets/images/john.jpg',
    imageEvent: imgevents[3],
    theme: 'festival',
  ),
  Event(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
    image: 'assets/images/steven.jpg',
    imageEvent: imgevents[4],
    theme: 'cinema',
  ),
  Event(
    sender: steven,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
    image: 'assets/images/steven.jpg',
    imageEvent: imgevents[5],
    theme: 'theme',
  ),
  Event(
    sender: sam,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
    image: 'assets/images/sam.jpg',
    imageEvent: imgevents[6],
    theme: 'cinema',
  ),
  Event(
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
    image: 'assets/images/greg.jpg',
    imageEvent: imgevents[7],
    theme: 'cinema',
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Event> messages = [
  Event(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Event(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Event(
    sender: james,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Event(
    sender: james,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Event(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Event(
    sender: james,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];