import 'package:flutter/material.dart';
import 'package:nft_showcase/features/collection/controllers/tab_collection_controller.dart';
import 'package:nft_showcase/features/collection/models/collection.dart';
import 'package:nft_showcase/features/collection/widgets/cell_collection_item.dart';
import 'package:provider/provider.dart';

class TabCollection extends StatefulWidget {
  const TabCollection({super.key});

  @override
  State<TabCollection> createState() => _TabCollectionState();
}

class _TabCollectionState extends State<TabCollection> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Collection>>(
        future: Provider.of<TabCollectionController>(context).fetchCollectionRanking(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return CellCollectionItem(item);
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
