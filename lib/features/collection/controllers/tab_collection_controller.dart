import 'package:flutter/material.dart';
import 'package:nft_showcase/features/collection/models/collection.dart';
import 'package:provider/provider.dart';

import '../../../repositories/collection_repository.dart';

class TabCollectionController {
  Future<List<Collection>> fetchCollectionRanking(
    BuildContext context,
  ) async => (await Provider.of<CollectionRepository>(context).getCollectionRanking()).collection;
}
