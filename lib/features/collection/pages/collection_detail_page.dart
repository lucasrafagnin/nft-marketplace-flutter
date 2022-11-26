import 'package:flutter/material.dart';
import 'package:nft_showcase/features/collection/controllers/collection_detail_controller.dart';
import 'package:nft_showcase/features/collection/models/collection.dart';
import 'package:nft_showcase/features/nft/widgets/cell_nft_item_simple.dart';
import 'package:nft_showcase/repositories/collection_repository_impl.dart';
import 'package:nft_showcase/service/api_service.dart';
import 'package:nft_showcase/features/nft/widgets/cell_nft_item.dart';

class CollectionDetail extends StatefulWidget {
  static const routeName = "/collection";
  final Collection collection;

  const CollectionDetail(this.collection, {super.key});

  @override
  State<CollectionDetail> createState() => _CollectionDetailState();
}

class _CollectionDetailState extends State<CollectionDetail> {
  final _controller = CollectionDetailController(
    CollectionRepositoryImpl(ApiService()),
  );

  @override
  void initState() {
    super.initState();
    _controller.fetchNFTsByCollection(widget.collection.contract);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                ValueListenableBuilder(
                  valueListenable: _controller.nftList,
                  builder: (context, value, child) {
                    if (value.isNotEmpty) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return CellNftItemSimple(value[index]);
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      );
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
