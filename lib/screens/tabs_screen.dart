import 'package:alarm_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFf),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFFFCFCFf),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 22,
              backgroundColor: const Color(0xFFC5E4FE),
              child: IconButton(
                  onPressed: () {},
                  icon: const Center(
                    child: Icon(
                      size: 30,
                      Icons.person,
                    ),
                  )),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  // radius: 2,
                  backgroundColor: const Color(0xFFC5E4FE),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_active,
                      )),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  // radius: 2,
                  backgroundColor: const Color(0xFFC5E4FE),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFFFCFCFf),
        animationDuration: const Duration(milliseconds: 1000),
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(
              Icons.home_filled,
              color: Color(0xFF2260FF),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.photo,
              color: Color(0xFF1883DB),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person,
              color: Color(0xFF1883DB),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.settings,
              color: Color(0xFF1883DB),
            ),
            label: '',
          ),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
      ),
      body: <Widget>[
        Container(
          color: const Color(0xFFFCFCFf),
          alignment: Alignment.center,
          child: const Text(''),
        ),

        const HomeScreen(),
        // Container(
        //   color: const Color(0xFFFCFCFf),
        //   alignment: Alignment.center,
        //   child: const Text(''),
        // ),

        Container(
          color: const Color(0xFFFCFCFf),
          alignment: Alignment.center,
          child: const Text(''),
        ),
        Container(
          color: const Color(0xFFFCFCFf),
          alignment: Alignment.center,
          child: const Text(''),
        ),
        Container(
          color: const Color(0xFFFCFCFf),
          alignment: Alignment.center,
          child: const Text(''),
        ),
      ][currentPageIndex],
    );
  }
}
