import 'package:flutter/material.dart';
import 'package:nft_showcase/features/collection/pages/collection_detail_page.dart';
import 'package:nft_showcase/features/collection/models/collection.dart';

import '../../../config.dart';

class CellCollectionItem extends StatelessWidget {
  final Collection _collection;

  const CellCollectionItem(this._collection, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: InkResponse(
        onTap: () => Navigator.pushNamed(
          context,
          CollectionDetail.routeName,
          arguments: _collection,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: _collection.contract,
              child: CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(_collection.logo),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _collection.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: customColors(context).primaryText,
                    ),
                  ),
                  Text(
                    _collection.getCategoryName(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: customColors(context).secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _collection.getMarketCapFormatted(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: customColors(context).primaryText,
                    ),
                  ),
                  Text(
                    _collection.getMarketCapChangeAsPercentage(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: _collection.marketCapChangePercentage < 0
                          ? customColors(context).marketNegative
                          : customColors(context).marketPositive,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
