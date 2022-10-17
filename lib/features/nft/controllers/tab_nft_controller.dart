import 'package:flutter/foundation.dart';
import 'package:nft_showcase/features/nft/models/nft.dart';

import '../../../repositories/collection_repository.dart';

class TabNftController {
  final CollectionRepository repository;
  var nftList = ValueNotifier<List<Nft>?>(null);

  TabNftController(this.repository);

  fetchNftRanking() async {
    nftList.value = (await repository.getNftRanking()).nfts;
  }
}
