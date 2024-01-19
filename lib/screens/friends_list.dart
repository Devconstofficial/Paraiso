import 'package:flutter/material.dart';
import 'package:paraiso/widgets/friends_tile.dart';

class HomeFriendsList extends StatelessWidget {
  const HomeFriendsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FriendsTile(
          friendName: 'Cassandre',
          sentFoodImage: 'burger 1.png',
          sentTo: 'Jeff Katz',
          location: 'Blue State Coffee',
          time: '1 min',
          friendImage: '7.png',
        ),
        FriendsTile(
          friendName: 'Mikel Jhons',
          sentFoodImage: 'coffee 1.png',
          sentTo: 'Jeff Katz',
          location: 'Blue State Coffee',
          time: '1 min',
          friendImage: '8.png',
        ),
        FriendsTile(
          friendName: 'Mikel Jhons',
          sentFoodImage: 'buritto 1.png',
          sentTo: 'Jeff Katz',
          location: 'Blue State Coffee',
          time: '1 min',
          friendImage: '9.png',
        ),
      ],
    );
  }
}
