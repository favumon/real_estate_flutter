import 'package:flutter/material.dart';
import 'package:real_estate_app/dashboard/widget/tab_bar_icon2.dart';
import 'package:real_estate_app/favorite_page/favorite_page.dart';
import 'package:real_estate_app/home_page/home_page.dart';
import 'package:real_estate_app/message_page/message_page.dart';
import 'package:real_estate_app/profile_page/profile_page.dart';

import '../search_page/search_page.dart';
import 'widget/floating_tab_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TabBarTab tab = TabBarTab.home;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        gradient: LinearGradient(end: Alignment.topLeft,begin: Alignment.bottomRight,colors:[
          Color(0xffF9E8D4),
          Color(0xffF8F8F8),
        ])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingTabBar(
          onTabSelected: (tab) {
            setState(() {
              this.tab = tab;
            });
          },
          selectedTab: this.tab,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: _getPage(tab),
      ),
    );
  }

  _getPage(TabBarTab tab) {
    switch (tab) {
      case TabBarTab.home:
        return HomePage();
      case TabBarTab.favorite:
        return FavoritePage();
      case TabBarTab.message:
        return MessagePage();
      case TabBarTab.profile:
        return ProfilePage();
      case TabBarTab.search:
        return SearchPage();
      default:
    }
  }
}
