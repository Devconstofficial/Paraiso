import 'package:flutter/material.dart';
import 'package:paraiso/widgets/restaurant_tile.dart';

class HomeRestaurantsList extends StatelessWidget {
  const HomeRestaurantsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RestaurantTile(
        restaurantName: 'McDonalds',
        restaurantDescription: '50% off on MidNight Deal & Family Deal',
        distance: '1 min',
        image: 'mcdonald.png',
      ),
      RestaurantTile(
        restaurantName: 'Starbucks',
        restaurantDescription: '50% off on Iced Latte & Iced Espresso',
        distance: '10 min',
        image: 'starbucks.png',
      ),
      RestaurantTile(
        restaurantName: 'Espresso Cafe',
        restaurantDescription:
            'Macaroni Pasta and Thai foods are available now',
        distance: '30 min',
        image: 'third_brand.png',
      ),
    ]);
  }
}
