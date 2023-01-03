import 'package:flutter/cupertino.dart';
import 'package:nft_showcase/features/nft/models/nft.dart';
import 'package:nft_showcase/repositories/collection_repository.dart';
import 'package:provider/provider.dart';

class CollectionDetailController {
  Future<List<Nft>> fetchNFTsByCollection(
    BuildContext context,
    String contract,
  ) async => await Provider.of<CollectionRepository>(context).getNFTsByCollection(contract);
}
