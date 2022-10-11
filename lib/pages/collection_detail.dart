import 'package:flutter/material.dart';
import 'package:nft_showcase/model/nft.dart';
import 'package:nft_showcase/service/service.dart';

class CollectionDetail extends StatefulWidget {
  final dynamic collection;

  const CollectionDetail(this.collection, {super.key});

  @override
  State<CollectionDetail> createState() => _CollectionDetailState();
}

class _CollectionDetailState extends State<CollectionDetail> {
  late Future<List<Nft>> nfts;

  @override
  void initState() {
    super.initState();

    nfts = Service().getNFTsByCollection(widget.collection.contract);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.collection.name),
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
                  return _cell(nfts[index]);
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

  Widget _cell(Nft nft) {
    return Card(
      child: Column(
        children: [
          Card(
            child: Image.network(
              nft.image,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
