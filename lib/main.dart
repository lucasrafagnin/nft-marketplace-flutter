import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nft_showcase/config.dart';
import 'package:nft_showcase/features/collection/pages/collection_detail_page.dart';
import 'package:nft_showcase/features/home/pages/home_page.dart';
import 'package:nft_showcase/features/nft/pages/nft_detail_page.dart';
import 'package:nft_showcase/features/collection/models/collection.dart';
import 'package:nft_showcase/features/nft/models/nft.dart';
import 'package:nft_showcase/theme/themes.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const NftShowcase());
}

class NftShowcase extends StatelessWidget {
  const NftShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: appTheme.current,
        builder: (context, value, child) {
          return MaterialApp(
            title: 'NFT Showcase',
            themeMode: value,
            theme: ThemeData.light().copyWith(
              extensions: <ThemeExtension<dynamic>>[
                Themes.light,
              ],
            ),
            darkTheme: ThemeData.dark().copyWith(
              extensions: <ThemeExtension<dynamic>>[
                Themes.dark,
              ],
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: HomePage.routeName,
            onGenerateRoute: (RouteSettings settings) {
              switch (settings.name) {
                case HomePage.routeName:
                  return getRoute(const HomePage());
                case CollectionDetail.routeName:
                  return getRoute(
                    CollectionDetail(settings.arguments as Collection),
                    fullScreen: true,
                  );
                case NftDetail.routeName:
                  return getRoute(
                    NftDetail(settings.arguments as Nft),
                    fullScreen: true,
                  );
                default:
                  return getRoute(const HomePage());
              }
            },
          );
        });
  }

  MaterialPageRoute getRoute(Widget screen, {bool fullScreen = false}) {
    return MaterialPageRoute(
      builder: (context) => screen,
      fullscreenDialog: fullScreen,
    );
  }
}
