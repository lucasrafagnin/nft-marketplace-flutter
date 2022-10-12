import 'package:flutter/material.dart';
import 'package:nft_showcase/models/collection.dart';

class CellCollectionItem extends StatelessWidget {
  final Collection _collection;

  const CellCollectionItem(this._collection, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkResponse(
        onTap: () => Navigator.pushNamed(
          context,
          "/collection",
          arguments: _collection,
        ),
        child: Image.network(
          _collection.logo,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
