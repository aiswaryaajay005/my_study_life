import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/reusable_back_button.dart';

class CustomScreens extends StatelessWidget {
  final int length;
  final String titleText;
  final List<String> tabNames;
  final List<Widget> screens;
  const CustomScreens({
    super.key,
    required this.length,
    required this.titleText,
    required this.tabNames,
    required this.screens,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              ReusablebackButton(),
              Text(
                titleText,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: tabNames.map((name) => Tab(text: name)).toList(),
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(children: screens),
      ),
    );
  }
}
