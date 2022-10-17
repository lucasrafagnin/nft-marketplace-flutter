import 'package:flutter/material.dart';
import 'package:nft_showcase/features/collection/pages/collection_detail_page.dart';
import 'package:nft_showcase/features/collection/models/collection.dart';

class CellCollectionItem extends StatelessWidget {
  final Collection _collection;

  const CellCollectionItem(this._collection, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkResponse(
        onTap: () => Navigator.pushNamed(
          context,
          CollectionDetail.routeName,
          arguments: _collection,
        ),
        child: Hero(
          tag: _collection.contract,
          child: Image.network(
            _collection.logo,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
