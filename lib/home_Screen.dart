import 'package:IOS/presentation/i_o_s_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_drawer.dart';
import 'main_screens/category.dart';
import 'main_screens/Home.dart';
import 'utils/ColorUtils.dart';

class HomeScreen extends StatelessWidget {
  final arrDrawerItems = [
    DrawerMenuItem(
        title: 'Home', iconData: Icons.home, subItemWidget: Text("")),
    DrawerMenuItem(
      title: 'Audit',
      iconData: Icons.settings_input_antenna,
      subItemWidget: const Text(''),
    ),
    DrawerMenuItem(
      title: 'Dashboard',
      iconData: Icons.dashboard,
      subItemWidget: const Text(''),
    ),
    DrawerMenuItem.fromIcon(
      title: 'Profile',
      icon: Icon(IOS.user),
      subItemWidget: const Text(''),
    ),
    DrawerMenuItem(
      title: 'Share',
      iconData: Icons.share,
      subItemWidget: const Text(''),
    ),
    DrawerMenuItem(
      title: 'Settings',
      iconData: Icons.settings,
      subItemWidget: const Text(''),
    ),
    DrawerMenuItem(
      title: 'Logout',
      iconData: Icons.logout,
      subItemWidget: const Text(''),
    ),
    DrawerMenuItem(
      title: 'Exit',
      iconData: Icons.exit_to_app,
      subItemWidget: const Text(''),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerVC(
        arrDrawerItems: arrDrawerItems,
        headerWidget: _buildHeaderForDrawer(context),
        isHeader: true,
        isShowIcon: true,
        textColor: Colors.black,
        selectedTextColor: Colors.amber,
        didItemSelected: (int selectedIndex) {},
      ),
      appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Consumer<DrawerNavigationProvider>(
            builder: (ctx, item, child) {
              if (item.selectedIndex == 0) {
                return const Text(
                  'First View',
                  style: TextStyle(color: Colors.white),
                );
              } else if (item.selectedIndex == 1) {
                return const Text('Second View',
                    style: TextStyle(color: Colors.white));
              } else {
                return Text(
                  "${item.selectedIndex}",
                  style: TextStyle(color: getRandomColor()),
                );
              }
            },
          ),
          brightness: Brightness.light),
      body: Center(
        child: Consumer<DrawerNavigationProvider>(
              builder: (ctx, item, child) {
                if (item.selectedIndex == 0) {
                  return Home();
                } else if (item.selectedIndex == 1) {
                  return Category();
                } else {
                  return Text("null");
                }
              },
            ) ??
            const Text('No data'),
      ),
    );
  }

  Widget _buildHeaderForDrawer(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/images/profile.png',
              height: 72.0,
              width: 72.0,
            ),
            const SizedBox(height: 12),
            const Text(
              'Omid Bahrami',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 4),
            const Text(
              'Rigger',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
    );
  }
}
