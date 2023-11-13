
class Resistances {
    final int fire;
    final int water;
    final int ice;
    final int thunder;
    final int dragon;

    Resistances({
        required this.fire,
        required this.water,
        required this.ice,
        required this.thunder,
        required this.dragon,
    });

    factory Resistances.fromJson(Map<String, dynamic> json) => Resistances(
        fire: json["fire"],
        water: json["water"],
        ice: json["ice"],
        thunder: json["thunder"],
        dragon: json["dragon"],
    );

    Map<String, dynamic> toJson() => {
        "fire": fire,
        "water": water,
        "ice": ice,
        "thunder": thunder,
        "dragon": dragon,
    };
}
