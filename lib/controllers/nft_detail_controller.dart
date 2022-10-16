import 'package:flutter/foundation.dart';
import 'package:nft_showcase/models/nft.dart';

import '../repositories/collection_repository.dart';

class NftDetailController {
  final CollectionRepository repository;
  var nft = ValueNotifier<Nft?>(null);

  NftDetailController(this.repository);

  fetchNFTDetail(String contract, String tokenId) async {
    nft.value = await repository.getNFTDetail(contract, tokenId);
  }
}
