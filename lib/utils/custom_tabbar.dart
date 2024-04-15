import 'package:fab_hr/utils/app_colors.dart';
import 'package:fab_hr/utils/common_fontstyle.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final List<Tab> tabs;
  final List<Widget> children;
  final bool isCreateEvent;
  final int currentIndex;
  CustomTabBar({
    required this.tabs,
    required this.children,
    this.isCreateEvent = false,
    this.currentIndex = 0,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      vsync: this,
      length: widget.tabs.length,
      initialIndex: widget.currentIndex,
    );
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: Stream.value(_tabController.index),
      builder: (context, snapshot) {
        return DefaultTabController(
          length: widget.tabs.length,
          child: Scaffold(
            backgroundColor: AppColors.bgColor,
            body: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: AppColors.bgColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.8),
                          blurRadius: 2,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.white,
                      unselectedLabelColor: AppColors.blackColor,
                      labelStyle: widget.tabs.length == 2
                          ? FontStyleGoogle.bold(AppColors.appThemeDark).s14
                          : FontStyleGoogle.bold(AppColors.appThemeDark).s12,
                      indicator: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.appThemeDark,
                            AppColors.appThemeLight,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        // color: AppColors.appThemeDark,
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      tabs: widget.tabs,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 75.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TabBarView(
                          controller: _tabController,
                          children: widget.children,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
