import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    Key? key,
    required this.tabIndex,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final int tabIndex;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.deepPurple,
      currentIndex: tabIndex,
      onTap: (int page) {
        _pageController.animateToPage(
          page,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.trending_up,
            color: Colors.white,
          ),
          label: "Trending",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.collections,
            color: Colors.grey,
          ),
          label: "Collections",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.wallet,
            color: Colors.grey,
          ),
          label: "Wallet",
        ),
      ],
    );
  }
}
