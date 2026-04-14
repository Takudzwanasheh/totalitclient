import 'package:flutter/material.dart';
import 'package:totaliclient/auth/screen/register_screen.dart';
import 'package:totaliclient/customers/screen/CustomersScreen.dart';
import 'package:totaliclient/home/widgets/sidebar_widget.dart';
import 'package:totaliclient/services/card-map.dart';
import 'package:totaliclient/sharedWidgets/card.dart';

import '../../services/side_bar_services.dart';
import '../model/card-data.dart';
import '../model/sidebar_map_data.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<SideBarMapData> sidebarItems = [];
  List<CardMap> cardItems = [];
  String _selectedRoute = "/";

  @override
  void initState() {
    super.initState();
    // Access sidebar items from the service
    sidebarItems = SideBarServices.getSideBarItem();
    cardItems = CardData.getCardData();
    
    // Set initial selection
    if (sidebarItems.isNotEmpty) {
      _selectedRoute = sidebarItems.first.route;
      sidebarItems[0] = SideBarMapData(
        title: sidebarItems[0].title,
        icon: sidebarItems[0].icon,
        route: sidebarItems[0].route,
        isSelected: true,
      );
    }
  }

  void _onSidebarItemTap(SideBarMapData tappedItem) {
    setState(() {
      _selectedRoute = tappedItem.route;
      // Update the list with new selection states
      sidebarItems = sidebarItems.map((item) {
        return SideBarMapData(
          title: item.title,
          icon: item.icon,
          route: item.route,
          isSelected: item.route == tappedItem.route,
        );
      }).toList();
    });
  }

  Widget _buildContent() {
    switch (_selectedRoute) {
      case "/":
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Home",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ItemCard(cardItems: cardItems),
            ],
          ),
        );

//routes for other sidebar items
      case "/customers": // Note: matched the route in side_bar_services.dart
        return const Customersscreen();
      case "/register": // Note: matched the route in side_bar_services.dart
        return const RegisterScreen();
      default:
        return Center(
          child: Text("Page for $_selectedRoute not implemented yet"),
        );



    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar
          SizedBox(
            width: 250,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.blueGrey.withOpacity(1), // Background color
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.blueGrey,
                          BlendMode.multiply, // or other blend modes
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEHnyi7hPdB2GENJeVX6Tj4xrLtlyxeG6-9A&s",
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SideBarWidget(
                    sidebarItems: sidebarItems,
                    onItemTap: _onSidebarItemTap,
                  ),
                ),
              ],
            ),
          ),
          // Main Content Area
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar and Account Logo
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey[400],
                              ),
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Content Area
                  Expanded(
                    child: _buildContent(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
