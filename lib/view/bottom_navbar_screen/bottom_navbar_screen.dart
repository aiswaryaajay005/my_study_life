import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/view/bottom_navbar_screen/tabs/classes_tab_view.dart';
import 'package:my_study_life/view/bottom_navbar_screen/tabs/exams_tab_view.dart';
import 'package:my_study_life/view/bottom_navbar_screen/tabs/tasks_tab_view.dart';
import 'package:my_study_life/view/bottom_navbar_screen/tabs/vacation_tab_view.dart';
import 'package:my_study_life/view/calender_screen/calender_screen.dart';
import 'package:my_study_life/view/home_screen/home_screen.dart';
import 'package:my_study_life/view/menu_screen/menu_screen.dart';
import 'package:my_study_life/view/premium_subscription/premium_subscription.dart';
import 'package:my_study_life/view/profile_screen/profile_screen.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _bottomNavIndex = 0;

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
      body: screens[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: ColorConstants.lightGrey,
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("New", style: TextStyle(fontSize: 24)),
                    ),
                    TabBar(
                      controller: _tabController,
                      onTap: (value) {
                        if (value == 4) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PremiumSubscription(),
                            ),
                          );
                        }
                      },
                      tabs: [
                        Tab(text: "Tasks"),
                        Tab(text: "Classes"),
                        Tab(text: "Exams"),
                        Tab(text: "Vacations"),
                        Tab(text: "Xtra"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          TasksTabView(),
                          ClassesTabView(),
                          ExamsTabView(),
                          VacationTabView(),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        shape: CircleBorder(),
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
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
    