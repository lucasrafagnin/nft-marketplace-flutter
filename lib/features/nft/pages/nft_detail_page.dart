import 'package:flutter/material.dart';
import 'package:nft_showcase/features/nft/controllers/nft_detail_controller.dart';
import 'package:nft_showcase/features/nft/models/nft.dart';
import 'package:nft_showcase/repositories/collection_repository_impl.dart';
import 'package:nft_showcase/service/api_service.dart';

class NftDetail extends StatefulWidget {
  static const routeName = "/nft/detail";
  final Nft nft;

  const NftDetail(this.nft, {super.key});

  @override
  State<NftDetail> createState() => NftDetailState();
}

class NftDetailState extends State<NftDetail> {
  final _controller = NftDetailController(
    CollectionRepositoryImpl(ApiService()),
  );

  @override
  void initState() {
    super.initState();
    _controller.fetchNFTDetail(
      widget.nft.contract,
      widget.nft.tokenId,
    );
  }

  @override
  Widget build(BuildContext context) {
    var nft = widget.nft;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.network(
                nft.image,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 24),
              ValueListenableBuilder(
                valueListenable: _controller.nft,
                builder: (context, value, child) =>
                    Text(value != null ? value.name : ""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
