import 'package:flutter/material.dart';
import 'package:nft_showcase/pages/collection_detail.dart';
import 'package:nft_showcase/pages/home_page.dart';

void main() {
  runApp(const NftShowcase());
}

class NftShowcase extends StatelessWidget {
  const NftShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFT Showcase',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return getRoute(const HomePage());
          case CollectionDetail.routeName:
            return getRoute(
              CollectionDetail(settings.arguments),
              fullScreen: true,
            );
          default:
            return getRoute(const HomePage());
        }
      },
    );
  }

  MaterialPageRoute getRoute(Widget screen, {bool fullScreen = false}) {
    return MaterialPageRoute(
      builder: (context) => screen,
      fullscreenDialog: fullScreen,
    );
  }
}
