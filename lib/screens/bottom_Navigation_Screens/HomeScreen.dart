
import 'package:cook/screens/for_You_Screen.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['Map', 'Following', 'For You'];
  int _currentIndex = 2;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: 2, // Start with "For You" selected
    );
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _currentIndex = _tabController.index;
      });
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColor.bottomBar.withOpacity(0.6),
      appBar: AppBar(
        backgroundColor: UiColor.bottomBar.withOpacity(0.6),
        elevation: 0,
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: _buildCustomTabBar(),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(
            "assets/Tabbaricon.png",
            height: 20,
            width: 20,
            color: Colors.white,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe
        children: [
          _buildContentPage('Map Content'),
          _buildContentPage('Following Content'),
           const ForYouPage(),
        ],
      ),
    );
  }

  Widget _buildCustomTabBar() {
    return Stack(
      children: [
        // Tab bar background
        Container(
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        // Tab indicator
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment:
                Alignment((_currentIndex * 2) / (_tabs.length - 1) - 1, 0),
            child: Container(
              width: 70,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(1.5),
              ),
            ),
          ),
        ),
        // Tab buttons
        Row(
          children: List.generate(_tabs.length, (index) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  _tabController.animateTo(index);
                },
                child: Center(
                  child: Text(
                    _tabs[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: _currentIndex == index
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color:
                          _currentIndex == index ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildContentPage(String text) {
    return Container(
      color: UiColor.bottomBar.withOpacity(0.6),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}

