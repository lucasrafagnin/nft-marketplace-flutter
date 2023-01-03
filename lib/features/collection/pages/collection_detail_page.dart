import 'package:flutter/material.dart';
import 'package:nft_showcase/config.dart';
import 'package:nft_showcase/features/collection/controllers/collection_detail_controller.dart';
import 'package:nft_showcase/features/collection/models/collection.dart';
import 'package:nft_showcase/features/nft/widgets/cell_nft_item_simple.dart';
import 'package:provider/provider.dart';

import '../../nft/models/nft.dart';

class CollectionDetail extends StatefulWidget {
  static const routeName = "/collection";
  final Collection collection;

  const CollectionDetail(this.collection, {super.key});

  @override
  State<CollectionDetail> createState() => _CollectionDetailState();
}

class _CollectionDetailState extends State<CollectionDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColors(context).background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                SizedBox(
                  height: 140,
                  width: 140,
                  child: Hero(
                    tag: widget.collection.contract,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(widget.collection.logo),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                FutureBuilder<List<Nft>>(
                  future: Provider.of<CollectionDetailController>(context)
                      .fetchNFTsByCollection(
                          context, widget.collection.contract),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final item = snapshot.data![index];
                          return CellNftItemSimple(item);
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
