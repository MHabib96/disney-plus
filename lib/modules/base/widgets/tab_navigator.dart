import 'package:disney_plus/modules/base/types/tab_type.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  final TabType tabType;
  final GlobalKey<NavigatorState> navigatorKey;

  const TabNavigator({
    Key? key,
    required this.tabType,
    required this.navigatorKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (tabType) {
      case TabType.Home:
        child = const Text('Home');
        break;
      case TabType.Search:
        child = const Text('Search');
        break;
      case TabType.Download:
        child = const Text('Download');
        break;
      case TabType.Profile:
        child = const Text('Profile');
        break;
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
