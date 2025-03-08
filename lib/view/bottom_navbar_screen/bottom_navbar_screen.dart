import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_study_life/view/calender_screen/calender_screen.dart';
import 'package:my_study_life/view/home_screen/home_screen.dart';
import 'package:my_study_life/view/menu_screen/menu_screen.dart';
import 'package:my_study_life/view/profile_screen/profile_screen.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  int _bottomNavIndex = 0; // Keeps track of selected tab

  final List<Widget> screens = [
    HomeScreen(),
    CalenderScreen(),
    MenuScreen(),
    ProfileScreen(),
  ];

  final List<IconData> iconList = [
    Icons.home,
    Icons.calendar_month_rounded,
    Icons.grid_view_rounded,
    Icons.person_4_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_bottomNavIndex], // Displays the selected page
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        activeColor: Colors.blue, // Active icon color
        inactiveColor: Colors.grey, // Inactive icon color
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}


  
 // return Scaffold(
    //   backgroundColor: ColorConstants.lightGrey,
    //   body: screens[index],
    //   floatingActionButton: FloatingActionButton(
    //     shape: CircleBorder(),
    //     backgroundColor: Colors.blue,
    //     onPressed: () {},
    //     child: Icon(Icons.add, color: Colors.white),
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    //   bottomNavigationBar: Container(
    //     height: 100,
    //     child: BottomNavigationBar(
    //       backgroundColor: Colors.white,
    //       onTap: (value) {
    //         index = value;
    //         selectedIndex = value;
    //         setState(() {});
    //       },
    //       currentIndex: selectedIndex,
    //       type: BottomNavigationBarType.fixed,
    //       items: [
    //         BottomNavigationBarItem(
              
    //           icon: Icon(Icons.home, color: ColorConstants.unSelectGrey),
    //           activeIcon: Icon(Icons.home, color: ColorConstants.selectBlue),
    //           label: "",
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.calendar_month_rounded,
    //             color: ColorConstants.unSelectGrey,
    //           ),
    //           activeIcon: Icon(
    //             Icons.calendar_month_rounded,
    //             color: ColorConstants.selectBlue,
    //           ),
    //           label: "",
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.grid_view_rounded,
    //             color: ColorConstants.unSelectGrey,
    //           ),
    //           activeIcon: Icon(
    //             Icons.grid_view_rounded,
    //             color: ColorConstants.selectBlue,
    //           ),
    //           label: "",
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.person_4_outlined,
    //             color: ColorConstants.unSelectGrey,
    //           ),
    //           activeIcon: Icon(
    //             Icons.person_4_outlined,
    //             color: ColorConstants.selectBlue,
    //           ),
    //           label: "",
    //         ),
    //       ],
    //     ),
    //   ),
    // );