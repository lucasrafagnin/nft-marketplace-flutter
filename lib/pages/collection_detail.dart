import 'package:flutter/material.dart';
import 'package:nft_showcase/controllers/collection_controller.dart';
import 'package:nft_showcase/models/collection.dart';
import 'package:nft_showcase/repositories/collection_repository_impl.dart';
import 'package:nft_showcase/service/api_service.dart';
import 'package:nft_showcase/widgets/cell_nft_item.dart';

class CollectionDetail extends StatefulWidget {
  static const routeName = "/collection";
  final Collection collection;

  const CollectionDetail(this.collection, {super.key});

  @override
  State<CollectionDetail> createState() => _CollectionDetailState();
}

class _CollectionDetailState extends State<CollectionDetail> {
  final _controller = CollectionController(
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.collection.name),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Hero(
                tag: widget.collection.contract,
                child: Image.network(
                  widget.collection.logo,
                  height: 220,
                  width: 220,
                  fit: BoxFit.fitHeight,
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
                        return CellNftItem(value[index]);
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
    );
  }
}
