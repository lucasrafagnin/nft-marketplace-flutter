class Nft {
  final String image;
  final String name;
  final String tokenId;
  final String contract;

  const Nft({
    required this.image,
    required this.name,
    required this.tokenId,
    required this.contract,
  });

  factory Nft.fromJson(Map<String, dynamic> json) {
    return Nft(
      image: json['image'],
      name: json['name'],
      tokenId: json['token_id'],
      contract: json['contract_address'],
    );
  }
}
