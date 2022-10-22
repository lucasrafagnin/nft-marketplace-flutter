import 'package:flutter/material.dart';
import 'package:nft_showcase/features/collection/pages/tab_collection_page.dart';
import 'package:nft_showcase/features/nft/pages/tab_nft_page.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Discover\nYour NFT",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        toolbarHeight: 88,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.light_mode,
                  color: Color(0xFF75CCD8),
                  size: 32,
                ),
              )),
        ],
      ),
      body: _tabs[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFF172645),
        currentIndex: pageIndex,
        onTap: (int page) {
          setState(() {
            pageIndex = page;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: "Discovery",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_copy_rounded),
            label: "Collections",
          ),
        ],
      ),
    );
  }
}
