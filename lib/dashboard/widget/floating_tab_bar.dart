import 'package:flutter/material.dart';
import 'package:real_estate_app/dashboard/widget/tab_bar_icon2.dart';

class FloatingTabBar extends StatelessWidget {
  final void Function(TabBarTab tab) onTabSelected;
  final TabBarTab selectedTab;
  const FloatingTabBar(
      {super.key, required this.onTabSelected, required this.selectedTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 265,
      decoration: BoxDecoration(
          color: const Color(0xff2B2B2B), borderRadius: BorderRadius.circular(100)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          5,
          (index) {
            return TabBarIcon(
                type: TabBarTab.values[index],
                isSelected: TabBarTab.values[index] == selectedTab,
                onTabSelected: onTabSelected);
          },
        ),
      ),
    );
  }
}

