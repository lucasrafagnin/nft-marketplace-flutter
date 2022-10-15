import 'package:flutter/material.dart';
import 'package:nft_showcase/controllers/tab_nft_controller.dart';
import 'package:nft_showcase/service/api_service.dart';
import 'package:nft_showcase/widgets/cell_nft_item.dart';
import '../repositories/collection_repository_impl.dart';

class TabNFT extends StatefulWidget {
  const TabNFT({super.key});

  @override
  State<TabNFT> createState() => _TabNFTState();
}

class _TabNFTState extends State<TabNFT> {
  final _controller = TabNftController(
    CollectionRepositoryImpl(ApiService()),
  );
  final categoryTags = [
    "All",
    "Metaverse",
    "Game",
    "Art",
    "Sports",
    "Photography"
  ];
  var choiceIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller.fetchNftRanking();
  }

  Widget _buildChoiceChips() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryTags.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              ChoiceChip(
                label: Text(categoryTags[index]),
                selected: choiceIndex == index,
                selectedColor: Colors.purpleAccent,
                onSelected: (bool selected) {
                  setState(() {
                    choiceIndex = selected ? index : choiceIndex;
                  });
                },
                backgroundColor: Colors.white10,
                labelStyle: const TextStyle(color: Colors.white),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildChoiceChips(),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _controller.nftList,
              builder: (context, value, child) {
                if (value != null) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return CellNftItem(value[index]);
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
