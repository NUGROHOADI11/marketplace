import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Your dashboard screen implementation
    return const DefaultTabController(
      length: 6, // there will be 4 tabs as an example
      child: Scaffold(
        backgroundColor:  Color(0xffEEDCC6),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 15),
                //   child: Text(
                //     "Food & Drink",
                //     style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 32,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                // SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "What would you like\nyour sushi today?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TabBar(
                  // controller: _tabController,
                  labelColor: Colors.black,
                  isScrollable: true,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 3,
                      color: Color(0xFFE57734),
                    ),
                  ),
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  labelPadding: EdgeInsets.symmetric(horizontal: 25),
                  tabs: [
                    Tab(text: "All"),
                    Tab(text: "Popular"),
                    Tab(text: "New"),
                    Tab(text: "Drink"),
                    Tab(text: "Food"),
                    Tab(text: "Summer"),
                  ],
                ),
                Flexible(
                  flex: 1,
                  child: TabBarView(
                    children: [
                      
                      // ItemsWidget(),
                      // ItemsWidget2(),
                      // ItemsWidget3(),
                      // ItemsWidget4(),
                      // ItemsWidget4(),
                      // ItemsWidget4(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
