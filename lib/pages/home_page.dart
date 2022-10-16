import 'package:flutter/material.dart';
import 'package:nft_showcase/pages/tab_collection.dart';
import 'package:nft_showcase/pages/tab_nft.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/";

  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _tabs = [const TabNFT(), const TabCollection()];
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("NFT Marketplace"),
        backgroundColor: Colors.black,
      ),
      body: _tabs[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.deepPurple,
        currentIndex: pageIndex,
        onTap: (int page) {
          setState(() {
            pageIndex = page;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: "Hype",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: "Collections",
          ),
        ],
      ),
    );
  }
}
