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
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, WidgetBuilder>{
          HomePage.routeName: (_) => const HomePage(),
          CollectionDetail.routeName: (_) =>
              CollectionDetail(settings.arguments),
        };
        WidgetBuilder? builder = routes[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder!(ctx));
      },
    );
  }
}
