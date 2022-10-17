import 'package:flutter/material.dart';
import 'package:nft_showcase/features/nft/pages/nft_detail_page.dart';
import 'package:nft_showcase/features/nft/models/nft.dart';

class CellNftItem extends StatelessWidget {
  final Nft _nft;
  const CellNftItem(this._nft, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        NftDetail.routeName,
        arguments: _nft,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                _nft.image,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 24,
                  color: Colors.purple.shade300,
                  child: Center(
                    child: Text(
                      _nft.name,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
