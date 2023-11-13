class Item {
    final int id;
    final int rarity;
    final int carryLimit;
    final int value;
    final String name;
    final String description;

    Item({
        required this.id,
        required this.rarity,
        required this.carryLimit,
        required this.value,
        required this.name,
        required this.description,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        rarity: json["rarity"],
        carryLimit: json["carryLimit"],
        value: json["value"],
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "rarity": rarity,
        "carryLimit": carryLimit,
        "value": value,
        "name": name,
        "description": description,
    };
}