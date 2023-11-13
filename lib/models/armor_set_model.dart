class ArmorSet {
    final int id;
    final String rank;
    final String name;
    final List<int> pieces;
    final int? bonus;

    ArmorSet({
        required this.id,
        required this.rank,
        required this.name,
        required this.pieces,
        required this.bonus,
    });

    factory ArmorSet.fromJson(Map<String, dynamic> json) => ArmorSet(
        id: json["id"],
        rank: json["rank"],
        name: json["name"],
        pieces: List<int>.from(json["pieces"].map((x) => x)),
        bonus: json["bonus"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "rank": rank,
        "name": name,
        "pieces": List<dynamic>.from(pieces.map((x) => x)),
        "bonus": bonus,
    };
}