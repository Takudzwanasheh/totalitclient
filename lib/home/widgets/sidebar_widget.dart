import 'package:flutter/material.dart';

import '../model/sidebar_map_data.dart';

class SideBarWidget extends StatelessWidget {
  final List<SideBarMapData> sidebarItems;
  final Function(SideBarMapData) onItemTap;

  const SideBarWidget({
    required this.sidebarItems,
    required this.onItemTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      width: 250,
      child: ListView.builder(
        itemCount: sidebarItems.length,
        itemBuilder: (context, index) {
          final item = sidebarItems[index];
          return ListTile(
            leading: Icon(
              item.icon,
              color: item.isSelected ? Colors.blue : Colors.white,
            ),
            title: Text(
              item.title,
              style: TextStyle(
                color: item.isSelected ? Colors.blue : Colors.white,
                fontWeight: item.isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            selected: item.isSelected,
            selectedTileColor: Colors.grey[800],
            onTap: () => onItemTap(item),
          );
        },
      ),
    );
  }
}
