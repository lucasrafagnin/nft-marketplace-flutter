import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:nft_showcase/config.dart';
import 'package:nft_showcase/features/nft/controllers/tab_nft_controller.dart';
import 'package:nft_showcase/features/nft/widgets/cell_nft_item.dart';
import 'package:provider/provider.dart';

import '../models/nft.dart';

class TabNFT extends StatefulWidget {
  const TabNFT({super.key});

  @override
  State<TabNFT> createState() => _TabNFTState();
}

class _TabNFTState extends State<TabNFT> {
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildChoiceChips(),
        Expanded(
          child: FutureBuilder<List<Nft>>(
            future:
                Provider.of<TabNftController>(context).fetchNftRanking(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Swiper(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  viewportFraction: 0.8,
                  scale: 0.95,
                  itemBuilder: (context, index) {
                    var item = snapshot.data![index];
                    return CellNftItem(item);
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
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
                    Provider.of<TabNftController>(context).fetchNftRanking(
                      context,
                      category: categoryTags[choiceIndex],
                    );
                  });
                },
                selected: choiceIndex == index,
                selectedColor: const Color(0xFF172645),
                backgroundColor: const Color(0xffF7F6F9),
                labelStyle: TextStyle(
                  color: choiceIndex == index
                      ? customColors(context).chipSelected
                      : customColors(context).chipUnselected,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
