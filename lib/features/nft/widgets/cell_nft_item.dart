import 'dart:ui';

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
        padding: const EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                _nft.image,
                fit: BoxFit.fitHeight,
              ),
              Positioned(bottom: 0, left: 0, right: 0, child: labelWidget()),
              Positioned(top: 0, right: 0, child: priceWidget()),
            ],
          ),
        ),
      ),
    );
  }

  Widget labelWidget() => SizedBox(
        height: 32,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Center(
              child: Text(
                _nft.name,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );

  Widget priceWidget() => Padding(
        padding: const EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            height: 32,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Center(
                child: Text(
                  _nft.priceFormatted(),
                  maxLines: 1,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
        ),
      );
}
