class Nft {
  final String image;
  final String tokenId;

  const Nft({
    required this.image,
    required this.tokenId,
  });

  factory Nft.fromJson(Map<String, dynamic> json) {
    return Nft(
      image: json['image'],
      tokenId: json['token_id'],
    );
  }
}
