import 'package:flutter/material.dart';
import 'package:hybrid_image/hybrid_image.dart';
import 'package:nft_showcase/features/nft/pages/nft_detail_page.dart';
import 'package:nft_showcase/features/nft/models/nft.dart';

class CellNftItemSimple extends StatelessWidget {
  final Nft _nft;

  const CellNftItemSimple(this._nft, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        NftDetail.routeName,
        arguments: _nft,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Card(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: SizedBox(
            height: 260,
            width: 320,
            child: HybridImage.network(
              _nft.image,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
