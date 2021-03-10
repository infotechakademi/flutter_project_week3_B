import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<Tab> tabBarItems;
  List<Widget> tabs = [];

  @override
  void initState() {
    tabBarItems = [
      Tab(
        icon: Icon(Icons.camera_alt),
      ),
      Tab(
        text: "Sohbetler",
      ),
      Tab(
        text: "Durum",
      )
    ];

    tabController = TabController(length: tabBarItems.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tabs = [
      Container(color: Colors.blue.withOpacity(0.5)),
      responsiveTab(),
      Container(color: Colors.red.withOpacity(0.5)),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade800,
        title: Text("E-Yazışma"),
        centerTitle: false,
        actions: [
          IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                tabController.animateTo(0);
              }),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {},
          ),
          IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        ],
        bottom: TabBar(
          indicatorWeight: 7,
          controller: tabController,
          tabs: tabBarItems,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: tabs,
      ),
    );
  }

  Widget responsiveTab() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
