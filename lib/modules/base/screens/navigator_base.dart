import 'package:disney_plus/modules/base/types/tab_type.dart';
import 'package:disney_plus/modules/base/widgets/tab_navigator.dart';
import 'package:disney_plus/widgets/movie_tabs/bloc/movie_tabs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      BlocProvider.of<MovieTabsBloc>(context).add(ResetTab());
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
        body: Stack(
          children: [
            _buildOffstageNavigator(TabType.Home),
            _buildOffstageNavigator(TabType.Search),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
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
