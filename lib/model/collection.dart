class Collection {
  final String name;
  final String logo;
  final String contract;

  const Collection({
    required this.name,
    required this.logo,
    required this.contract,
  });

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      name: json['name'],
      logo: json['logo'],
      contract: json['contracts'][0],
    );
  }
}
