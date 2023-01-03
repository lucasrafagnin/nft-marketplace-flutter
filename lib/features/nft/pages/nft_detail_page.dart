import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:nft_showcase/config.dart';
import 'package:nft_showcase/features/nft/controllers/nft_detail_controller.dart';
import 'package:nft_showcase/features/nft/models/nft.dart';
import 'package:provider/provider.dart';

class NftDetail extends StatefulWidget {
  static const routeName = "/nft/detail";
  final Nft nft;

  const NftDetail(this.nft, {super.key});

  @override
  State<NftDetail> createState() => NftDetailState();
}

class NftDetailState extends State<NftDetail> {
  @override
  Widget build(BuildContext context) {
    var nft = widget.nft;
    return Scaffold(
      backgroundColor: customColors(context).background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ExtendedImage.network(
                  nft.image,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                  cache: true,
                ),
                Positioned(
                  left: 12,
                  top: 32,
                  child: SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.transparent),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            FutureBuilder<Nft>(
              future: Provider.of<NftDetailController>(context).fetchNFTDetail(
                context,
                widget.nft.contract,
                widget.nft.tokenId,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _buildNftDetail(snapshot.data!);
                } else if (snapshot.hasError) {
                  return _buildError(snapshot.error);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNftDetail(Nft nft) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            nft.name,
            style: TextStyle(
              color: customColors(context).primaryText,
              fontSize: 22,
            ),
            textAlign: TextAlign.start,
          ),
          const Divider(height: 40),
        ],
      ),
    );
  }

  Widget _buildError(Object? error) {
    return Text("$error");
  }
}
