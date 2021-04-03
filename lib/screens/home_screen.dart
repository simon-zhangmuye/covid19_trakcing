import 'package:covid19_trakcing/screens/all_countries_screen.dart';
import 'package:covid19_trakcing/screens/global_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('COVID19 TRACKING'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'GLOBAL',
                icon: FaIcon(FontAwesomeIcons.globe),
              ),
              Tab(
                text: 'ALL COUNTRIES',
                icon: FaIcon(FontAwesomeIcons.list),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GlobalScreen(),
            AllCountriesScreen(),
          ],
        ),
      ),
    );
  }
}
