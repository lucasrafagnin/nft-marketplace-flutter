class Nft {
  final String image;
  final String name;
  final String tokenId;
  final String contract;
  final double price;
  final String crypto;

  const Nft({
    required this.image,
    required this.name,
    required this.tokenId,
    required this.contract,
    required this.price,
    required this.crypto,
  });

  factory Nft.fromJson(Map<String, dynamic> json) {
    return Nft(
      image: json['image'],
      name: json['name'],
      tokenId: json['token_id'],
      contract: json['contract_address'],
      price: json['max_price']["value"],
      crypto: json['max_price']["crypto_unit"],
    );
  }

  String nameFormatted() => name.replaceAll("#", "\n#");

  String priceFormatted() => "${price.toStringAsFixed(2)} $crypto";
}
