import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:totaliclient/services/card-map.dart';

class CardData{
  static List<CardMap> getCardData(){
    return [
      CardMap(
        title: "Tatal Serveces",
        icon: Icons.auto_fix_high,
        figure: 3,
        color: Colors.lightBlue
      ),
      CardMap(
          title: "Tatal Stock",
          icon: Icons.gif_box_rounded,
          figure: 3,
          color: Colors.orange
      ),
      CardMap(
          title: "Tatal Categories",
          icon: Icons.category,
          figure: 3,
          color: Colors.green
      ),
      CardMap(
          title: "Tatal Items",
          icon: Icons.settings,
          figure: 3,
          color: Colors.grey
      ),
      CardMap(
          title: "Tatal Orders",
          icon: Icons.shopping_cart,
          figure: 3,
          color: Colors.orange
      ),
      CardMap(
          title: "Tatal Customers",
          icon: Icons.person,
          figure: 3,
          color: Colors.blue
      )
    ];
  }
}