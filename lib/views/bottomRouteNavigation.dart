import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technical/variables.dart';
import 'package:technical/views/createPostScreen.dart';
import 'package:technical/views/homeScreen.dart';
import 'package:technical/views/world.dart';

import 'myProfile.dart';

class BottomRouteNavigation extends StatefulWidget {
  const BottomRouteNavigation({super.key});

  @override
  State<BottomRouteNavigation> createState() => _BottomRouteNavigationState();
}

class _BottomRouteNavigationState extends State<BottomRouteNavigation> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: _buildPageContent(),
    );
  }

  Widget _buildPageContent() {
    // Implement the content of each tab based on the selected index (_currentIndex)
    // You can use a widget like IndexedStack or a Navigator with multiple pages
    // Here's an example using IndexedStack:
    return IndexedStack(
      index: currentIndex,
      children: const [
        // Add your tab content widgets here
        // Example:
       // const DashBoard(),

        HomeScreen(),
        World(),
        CreatePostScreen(),
        MyProfile(),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    // Set your desired background color here

    return BottomNavigationBar(
      currentIndex: currentIndex,
     // selectedItemColor: GlobalVariables.mainColor,
      unselectedItemColor: Colors.black,
      selectedItemColor: Variables.orangeColor,
      backgroundColor:  Colors.green,

      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (int newIndex) {
        // Update the selected index when a tab is tapped
        setState(() {
          currentIndex = newIndex;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon:const FaIcon(FontAwesomeIcons.house),
          label: 'Home',
          activeIcon:FaIcon(FontAwesomeIcons.house,color: Variables.orangeColor,)
        ),
        BottomNavigationBarItem(
            icon:const FaIcon(FontAwesomeIcons.earthAmericas),
            label: 'World',
            activeIcon:FaIcon(FontAwesomeIcons.earthAmericas,color: Variables.orangeColor,)
        ),
        BottomNavigationBarItem(
            icon:const FaIcon(FontAwesomeIcons.plus),
            label: 'Create',
            activeIcon:FaIcon(FontAwesomeIcons.plus,color: Variables.orangeColor,)
        ),
        BottomNavigationBarItem(
            icon:const FaIcon(FontAwesomeIcons.solidUser),
            label: 'Profile',
            activeIcon:FaIcon(FontAwesomeIcons.solidUser,color: Variables.orangeColor,)
        ),
      ],
    );
  }
}


