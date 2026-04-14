import 'package:flutter/material.dart';

import '../home/model/sidebar_map_data.dart';

class SideBarServices {
  static List<SideBarMapData> getSideBarItem(){
      return[
        SideBarMapData(
            title: "DashBoard",
            icon: Icons.dashboard,
            route: "/"),
        SideBarMapData(
          title: 'Customers',
          icon: Icons.people,
          route: '/customers',
        ),
        SideBarMapData(
          title: 'Check In',
          icon: Icons.check,
          route: '/check-in',
        ),
        SideBarMapData(
          title: 'Services',
          icon: Icons.electrical_services_sharp,
          route: '/service.dart',
        ),
        SideBarMapData(
          title: 'Category',
          icon: Icons.category,
          route: '/category',
        ),
        SideBarMapData(
          title: 'Stock',
          icon: Icons.production_quantity_limits,
          route: '/stock',
        ),
        SideBarMapData(
          title: 'Suppliers',
          icon: Icons.delivery_dining,
          route: '/suppliers',
        ),
        SideBarMapData(
          title: 'Register',
          icon: Icons.person_add,
          route: '/register',
        ),
      ];
  }
}
