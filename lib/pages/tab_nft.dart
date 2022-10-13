import 'package:flutter/material.dart';
import 'package:nft_showcase/controllers/tab_nft_controller.dart';
import 'package:nft_showcase/service/api_service.dart';
import 'package:nft_showcase/widgets/cell_nft_item.dart';
import '../repositories/collection_repository_impl.dart';

class TabNFT extends StatefulWidget {
  const TabNFT({super.key});

  @override
  State<TabNFT> createState() => _TabNFTState();
}

class _TabNFTState extends State<TabNFT> {
  final _controller = TabNftController(
    CollectionRepositoryImpl(ApiService()),
  );

  @override
  void initState() {
    super.initState();
    _controller.fetchNftRanking();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder(
        valueListenable: _controller.nftList,
        builder: (context, value, child) {
          if (value != null) {
            return GridView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                return CellNftItem(value[index]);
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
