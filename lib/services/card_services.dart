import 'package:flutter/material.dart';
import 'package:totaliclient/services/card-map.dart';

class CardServices {
  static List<CardMap> getCardItems() {
    return [
      CardMap(
        figure: 8,
        title: "Total Services",
        icon: Icons.auto_fix_high,
        color: Colors.blue,
      ),
      CardMap(
        figure: 120,
        title: "Total Customers",
        icon: Icons.people,
        color: Colors.green,
      ),
      CardMap(
        figure: 50,
        title: "Pending Orders",
        icon: Icons.pending_actions,
        color: Colors.orange,
      ),
      CardMap(
        figure: 25,
        title: "New Bookings",
        icon: Icons.book_online,
        color: Colors.purple,
      ),
    ];
  }
}
