import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DrawerVC extends StatelessWidget {
  Color selectedTextColor;
  Color textColor;
  int selectedIndex = 0;
  bool isHeader = true;
  bool isShowIcon = true;
  Widget headerWidget;
  List<DrawerMenuItem> arrDrawerItems;
  Function(int) didItemSelected;

  // ignore: sort_ constructors_first
  Icon? getIcon(DrawerMenuItem drawerMenuItem) {
    if (drawerMenuItem.icon == null)
      return Icon(drawerMenuItem.iconData);
    else
      return drawerMenuItem.icon;
  }

  DrawerVC({
    required this.arrDrawerItems,
    required this.isHeader,
    required this.headerWidget,
    required this.isShowIcon,
    required this.textColor,
    required this.selectedTextColor,
    required this.didItemSelected,
  });
  @override
  Widget build(BuildContext context) {
    final DrawerNavigationProvider navigationProvider =
        Provider.of<DrawerNavigationProvider>(context, listen: false);

    return Drawer(
      child: Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(0.0),
          itemCount: arrDrawerItems!.length + 1,
          itemBuilder: (ctx, index) {
            final int idx = index - 1;
            return index == 0
                ? isHeader
                    ? headerWidget ??
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      )
                : GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          if (isShowIcon)
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 0, top: 0, right: 10, bottom: 0),
                                child: getIcon(arrDrawerItems[idx]))
                          else
                            Container(),
                          Expanded(
                            child: Text(
                              arrDrawerItems[idx].title,
                              style: TextStyle(
                                  color: idx == selectedIndex
                                      ? selectedTextColor
                                      : textColor),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 10, top: 0, right: 0, bottom: 0),
                              child: arrDrawerItems[idx].subItemWidget ??
                                  Container()),
                        ],
                      ),
                    ),
                    onTap: () {
                      didItemSelected(idx);
                      selectedIndex = idx;
                      navigationProvider.setDraweNavigation(idx);
                      Navigator.pop(context);
                    },
                  );
          },
        ),
      ),
    );
  }

//   void navigateToSelectedScreen(int selectedItemIndex, BuildContext context) {
//     final DrawerProvider baseData =
//         Provider.of<DrawerProvider>(context, listen: false);

//     if (baseData.drawerOption == selectedItemIndex) {
//       Navigator.of(context).pop();
//       return;
//     }

//     switch (selectedItemIndex) {
//       case DrawerOption.home:
//         baseData.setBaseData(
//             title: 'Quotes Category', selectedDrawerOption: DrawerOption.home);
//         break;

//       case DrawerOption.categories:
//         baseData.setBaseData(
//             title: 'Favourites', selectedDrawerOption: DrawerOption.categories);
//         break;

//       case DrawerOption.aboutUs:
//         baseData.setBaseData(
//             title: 'Search', selectedDrawerOption: DrawerOption.aboutUs);
//         break;

//       default:
//         break;
//     }
//     Navigator.of(context).pop();
//   }
}

class DrawerMenuItem {
  String title;
  IconData? iconData;
  Icon? icon;
  Widget subItemWidget;

  // ignore: sort_constructors_first
  DrawerMenuItem(
      {required this.title,
      required this.iconData,
      required this.subItemWidget});

  DrawerMenuItem.fromIcon(
      {required this.title, required this.icon, required this.subItemWidget});
}

class DrawerNavigationProvider with ChangeNotifier {
  int selectedIndex = 0;

  void setDraweNavigation(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
