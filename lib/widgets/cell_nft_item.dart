import 'package:flutter/material.dart';
import 'package:nft_showcase/models/nft.dart';

class CellNftItem extends StatelessWidget {
  final Nft _nft;
  const CellNftItem(this._nft, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Card(
            child: Image.network(
              _nft.image,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
