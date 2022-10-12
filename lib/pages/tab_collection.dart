import 'package:flutter/material.dart';

import '../models/ranking_collection.dart';
import '../repositories/collection_repository_impl.dart';
import '../widgets/cell_collection_item.dart';

class TabCollection extends StatefulWidget {
  const TabCollection({super.key});

  @override
  State<TabCollection> createState() => _TabCollectionState();
}

class _TabCollectionState extends State<TabCollection> {
  final _collectionRepository = CollectionRepositoryImpl();
  late Future<RankingCollection> _ranking;

  @override
  void initState() {
    super.initState();
    _ranking = _collectionRepository.getCollectionRanking();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<RankingCollection>(
        future: _ranking,
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
    );
  }
}
