import 'package:disney_plus/modules/types/tab_type.dart';
import 'package:disney_plus/modules/widgets/tab_navigator.dart';
import 'package:flutter/material.dart';

class NavigatorBase extends StatefulWidget {
  const NavigatorBase({Key? key}) : super(key: key);

  @override
  _NavigatorBaseState createState() => _NavigatorBaseState();
}

class _NavigatorBaseState extends State<NavigatorBase> {
  TabType _currentTab = TabType.Home;
  int _currentIndex = 0;

  final Map<TabType, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabType.Home: GlobalKey<NavigatorState>(),
    TabType.Search: GlobalKey<NavigatorState>(),
  };

  void _onSelectedTab(TabType selectedTab) {
    //Navigate back to tab route when current tab is selected.
    if (selectedTab == _currentTab) {
      _navigatorKeys[selectedTab]!.currentState!.popUntil((route) => route.isFirst);
    }
    //Update state to newly selected tab screen.
    else {
      setState(() {
        _currentTab = selectedTab;
        _currentIndex = selectedTab.index;
      });
    }
  }

  Widget _buildOffstageNavigator(TabType tabType) {
    return Offstage(
      offstage: _currentTab != tabType,
      child: TabNavigator(
        tabType: tabType,
        navigatorKey: _navigatorKeys[tabType]!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await _navigatorKeys[_currentTab]!.currentState!.maybePop(),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(54, 69, 79, 0.2),
        body: Stack(
          children: [
            _buildOffstageNavigator(TabType.Home),
            _buildOffstageNavigator(TabType.Search),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.blueGrey,
          backgroundColor: const Color.fromRGBO(54, 69, 79, 0.3),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) => _onSelectedTab(TabType.values[index]),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ],
        ),
      ),
    );
  }
}
