import 'package:flutter/material.dart';
import 'package:nft_showcase/features/nft/models/nft.dart';
import 'package:provider/provider.dart';

import '../../../repositories/collection_repository.dart';

class NftDetailController {
  Future<Nft> fetchNFTDetail(
    BuildContext context,
    String contract,
    String tokenId,
  ) async => await Provider.of<CollectionRepository>(context).getNFTDetail(
      contract,
      tokenId,
    );
}
