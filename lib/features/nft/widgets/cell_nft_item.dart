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
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 6,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: SizedBox(
            height: 260,
            width: 320,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  _nft.image,
                  fit: BoxFit.fitHeight,
                ),
                Positioned(top: 0, left: 0, child: labelWidget()),
                Positioned(bottom: 0, left: 0, right: 0, child: priceWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget labelWidget() => Padding(
        padding: const EdgeInsets.only(top: 16, left: 16),
        child: Text(
          _nft.nameFormatted(),
          maxLines: 2,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
        ),
      );

  Widget priceWidget() => Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            height: 60,
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _nft.priceFormatted(),
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const Text(
                        "Floor price",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: const Color(0xFF75CCD8),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
