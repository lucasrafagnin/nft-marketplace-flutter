import 'package:flutter/material.dart';
import 'package:nft_showcase/model/collection.dart';
import 'package:nft_showcase/model/ranking.dart';
import 'package:nft_showcase/pages/collection_detail.dart';
import 'package:nft_showcase/service/service.dart';

import '../widget/custom_bottom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  late Future<Ranking> ranking;
  var tabIndex = 0;

  @override
  void initState() {
    super.initState();
    ranking = Service().getCollectionRanking();
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
                  return _cell(ranking.collection[index]);
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

  Widget _cell(Collection collection) {
    return Card(
      child: InkResponse(
        onTap: () => Navigator.pushNamed(
          context,
          "/collection",
          arguments: collection,
        ),
        child: Image.network(
          collection.logo,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
