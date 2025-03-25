
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'bottom_Navigation_Screens/HomeScreen.dart';
import 'bottom_Navigation_Screens/explore_Screen.dart';
import 'bottom_Navigation_Screens/inbox_Screen.dart';
import 'bottom_Navigation_Screens/profile_Screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  // Screens for Navigation
  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const CenterScreen(), // This is for FAB (optional, you can remove it)
    const InboxScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) return; // Prevents FAB from triggering bottom nav change
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColor.bottomBar.withOpacity(0.6),
      body: _screens[_selectedIndex],

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedIndex = 2; // Navigate to CenterScreen (if needed)
          });
        },
        backgroundColor: UiColor.dotsColor,
        shape: const CircleBorder(),
        elevation: 5,
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        color: UiColor.bottomBar.withOpacity(0.6),

        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(

          height: 60, // Adjust height if needed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side of FAB
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildNavItem(Icons.home, "Home", 0),
                  buildNavItem(Icons.explore_outlined, "Explore", 1),
                ],
              ),

              // Right side of FAB
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildNavItem(Icons.all_inbox, "Inbox", 3),
                  buildNavItem(Icons.person, "Profile", 4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Navigation Item Builder
  Widget buildNavItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                size: 28,
                color:
                    _selectedIndex == index ? UiColor.dotsColor : Colors.grey),
            Text(label,
                style: TextStyle(
                    fontSize: 12,
                    color: _selectedIndex == index
                        ? UiColor.dotsColor
                        : Colors.grey)),
          ],
        ),
      ),
    );
  }
}




class CenterScreen extends StatelessWidget {
  const CenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text("➕ Center Screen (FAB Clicked)",
              style: TextStyle(fontSize: 24))),
    );
  }
}


