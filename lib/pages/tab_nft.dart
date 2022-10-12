import 'package:flutter/material.dart';
import 'package:nft_showcase/models/ranking_nft.dart';
import 'package:nft_showcase/widgets/cell_nft_item.dart';
import '../repositories/collection_repository_impl.dart';

class TabNFT extends StatefulWidget {
  const TabNFT({super.key});

  @override
  State<TabNFT> createState() => _TabNFTState();
}

class _TabNFTState extends State<TabNFT> {
  final _collectionRepository = CollectionRepositoryImpl();
  late Future<RankingNft> _ranking;

  @override
  void initState() {
    super.initState();
    _ranking = _collectionRepository.getNftRanking();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<RankingNft>(
        future: _ranking,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var ranking = snapshot.data!;
            return GridView.builder(
              itemCount: ranking.nfts.length,
              itemBuilder: (context, index) {
                return CellNftItem(ranking.nfts[index]);
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
