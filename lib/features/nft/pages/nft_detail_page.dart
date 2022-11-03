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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  nft.image,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  left: 20,
                  top: 40,
                  child: SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.transparent
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 40,
                  child: SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: const Color(0xA6FFFFFF),
                      ),
                      child: const Icon(
                        Icons.favorite,
                        size: 24,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ValueListenableBuilder(
              valueListenable: _controller.nft,
              builder: (context, value, child) => _buildNftDetail(value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNftDetail(Nft? nft) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          Text(
            "Nome do NFT",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
            textAlign: TextAlign.start,
          ),
          Divider(height: 40),
          Text(
            "Descrição do NFTDescrição do NFT Descrição do NFT Descrição do NFT Descrição do NFT Descrição do NFT Descrição do NFT",
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
