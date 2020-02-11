import 'package:flutter/material.dart';
import 'package:demo_app/presentation/dashboard/dashboard_page.dart';

enum HomePageOptions {
  dashboard,
  search,
  favorite,
  settings,
}


class HomePage extends StatefulWidget {

  final HomePageOptions page;

  const HomePage({Key key, this.page}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedPageIndex;

  @override
  void initState() {
    super.initState();
    _selectedPageIndex = widget.page?.index ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
//      body: Text('Hallo'),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  final List<Widget> _pages = [
    DashboardPage(),
    DashboardPage(),
    DashboardPage(),
    DashboardPage(),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomNavigationBar,
      currentIndex: _selectedPageIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Theme.of(context).primaryColor,
      onTap: _onItemSelected,
    );
  }

  final _bottomNavigationBar = <BottomNavigationBarItem>[
    _bottomNavigationBarItem(Icons.dashboard, 'Dashboard'),
    _bottomNavigationBarItem(Icons.search, 'Search'),
    _bottomNavigationBarItem(Icons.favorite, 'Favorite'),
    _bottomNavigationBarItem(Icons.settings, 'Settings'),
  ];

  static BottomNavigationBarItem _bottomNavigationBarItem(
      IconData iconData, String label) {
    return BottomNavigationBarItem(
      icon: Icon(iconData),
      title: Text(label),
    );
  }
}
