import 'package:flutter/material.dart';
import 'package:nft_showcase/controllers/tab_collection_controller.dart';
import 'package:nft_showcase/service/api_service.dart';

import '../repositories/collection_repository_impl.dart';
import '../widgets/cell_collection_item.dart';

class TabCollection extends StatefulWidget {
  const TabCollection({super.key});

  @override
  State<TabCollection> createState() => _TabCollectionState();
}

class _TabCollectionState extends State<TabCollection> {
  final _controller = TabCollectionController(
    CollectionRepositoryImpl(ApiService()),
  );

  @override
  void initState() {
    super.initState();
    _controller.fetchCollectionRanking();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder(
        valueListenable: _controller.collectionList,
        builder: (context, value, child) {
          if (value != null) {
            return GridView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                return CellCollectionItem(value[index]);
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
