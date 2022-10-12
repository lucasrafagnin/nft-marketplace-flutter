import 'package:flutter/material.dart';
import 'package:nft_showcase/models/nft.dart';
import 'package:nft_showcase/repositories/collection_repository_impl.dart';
import 'package:nft_showcase/widgets/cell_nft_item.dart';

class CollectionDetail extends StatefulWidget {
  static const routeName = "/collection";
  final dynamic collection;

  const CollectionDetail(this.collection, {super.key});

  @override
  State<CollectionDetail> createState() => _CollectionDetailState();
}

class _CollectionDetailState extends State<CollectionDetail> {
  late Future<List<Nft>> nfts;
  final _collectionRepository = CollectionRepositoryImpl();

  @override
  void initState() {
    super.initState();

    nfts =
        _collectionRepository.getNFTsByCollection(widget.collection.contract);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.collection.name),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: FutureBuilder<List<Nft>>(
          future: nfts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var nfts = snapshot.data!;
              return GridView.builder(
                itemCount: nfts.length,
                itemBuilder: (context, index) {
                  return CellNftItem(nfts[index]);
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
    );
  }
}
