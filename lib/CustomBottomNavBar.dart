import 'package:bottom_nav_bar/feed.dart';
import 'package:bottom_nav_bar/home.dart';
import 'package:bottom_nav_bar/profile.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: 40,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: DefaultTabController(
            length: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                  boxShadow: const [
                    //background color of box
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.22),
                      blurRadius: 4.0, // soften the shadow
                      spreadRadius: 0.5, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        0.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: TabBar(
                  controller: _controller,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  tabs: const [
                    Tab(
                      text: "Home",
                    ),
                    Tab(
                      text: "Feed",
                    ),
                    Tab(
                      text: "Profile",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          HomePage(),
          FeedPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}
