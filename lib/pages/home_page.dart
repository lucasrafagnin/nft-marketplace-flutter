import 'package:flutter/material.dart';
import 'package:nft_showcase/models/ranking.dart';
import 'package:nft_showcase/repositories/collection_repository_impl.dart';
import 'package:nft_showcase/widgets/cell_collection_item.dart';

import '../widgets/custom_bottom.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/";

  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  final _collectionRepository = CollectionRepositoryImpl();
  late Future<Ranking> ranking;
  var tabIndex = 0;

  @override
  void initState() {
    super.initState();
    ranking = _collectionRepository.getCollectionRanking();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("NFT Marketplace"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: FutureBuilder<Ranking>(
          future: ranking,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var ranking = snapshot.data!;
              return GridView.builder(
                itemCount: ranking.collection.length,
                itemBuilder: (context, index) {
                  return CellCollectionItem(ranking.collection[index]);
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      bottomNavigationBar: CustomBottom(
        tabIndex: tabIndex,
        pageController: _pageController,
      ),
    );
  }
}
