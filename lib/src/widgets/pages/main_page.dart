import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantpedia/src/widgets/templates/plants_tab.dart';
import 'package:plantpedia/src/widgets/templates/settings_tab.dart';

class MainPage extends StatelessWidget {
  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      PlantsTab(),
      SettingsPage(),
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'PlantPedia',
          ),
        ),
        body: TabBarView(
          children: tabs,
        ),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(FontAwesomeIcons.leaf),
              text: 'Species',
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.cogs),
              text: 'Settings',
            )
          ],
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.blueGrey,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.blue,
        ),
      ),
    );
  }
}
