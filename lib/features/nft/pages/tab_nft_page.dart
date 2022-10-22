import 'package:flutter/material.dart';
import 'package:nft_showcase/features/nft/controllers/tab_nft_controller.dart';
import 'package:nft_showcase/repositories/collection_repository_impl.dart';
import 'package:nft_showcase/service/api_service.dart';
import 'package:nft_showcase/features/nft/widgets/cell_nft_item.dart';

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
                onSelected: (bool selected) {
                  setState(() {
                    choiceIndex = selected ? index : choiceIndex;
                  });
                },
                selected: choiceIndex == index,
                selectedColor: const Color(0xFF172645),
                backgroundColor: const Color(0xffF7F6F9),
                labelStyle: TextStyle(
                  color: choiceIndex == index ? Colors.white : Colors.black45,
                ),
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
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: SizedBox(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return CellNftItem(value[index]);
                        },
                      ),
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
