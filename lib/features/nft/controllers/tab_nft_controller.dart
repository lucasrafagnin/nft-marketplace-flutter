import 'package:flutter/material.dart';
import 'package:nft_showcase/features/nft/models/nft.dart';
import 'package:provider/provider.dart';

import '../../../repositories/collection_repository.dart';

class TabNftController {
  var nftList = ValueNotifier<List<Nft>>(List.empty());

  fetchNftRanking(
    BuildContext context, {
    String category = "ALL",
  }) async {
    nftList.value =
        (await Provider.of<CollectionRepository>(context, listen: false).getNftRanking(
      category.toUpperCase(),
    )).nfts;
  }
}
