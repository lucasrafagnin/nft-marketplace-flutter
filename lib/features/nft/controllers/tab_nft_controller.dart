import 'package:flutter/material.dart';
import 'package:nft_showcase/features/nft/models/nft.dart';
import 'package:provider/provider.dart';

import '../../../repositories/collection_repository.dart';

class TabNftController {
  var nftList = ValueNotifier<List<Nft>>(List.empty());

   Future<List<Nft>> fetchNftRanking(
    BuildContext context, {
    String category = "ALL",
  }) async {
     var response = (await Provider.of<CollectionRepository>(context).getNftRanking(
      category.toUpperCase(),
    )).nfts;
    nftList.value = response;
    return response;
  }
}
