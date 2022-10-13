import 'package:flutter/foundation.dart';
import 'package:nft_showcase/models/collection.dart';

import '../repositories/collection_repository.dart';

class TabCollectionController {
  final CollectionRepository repository;
  var collectionList = ValueNotifier<List<Collection>?>(null);

  TabCollectionController(this.repository);

  fetchCollectionRanking() async {
    collectionList.value = (await repository.getCollectionRanking()).collection;
  }
}
