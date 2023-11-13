class Skill {
    final int id;
    final int level;
    final Map<String, dynamic> modifiers;
    final String description;
    final int skill;
    final String skillName;

    Skill({
        required this.id,
        required this.level,
        required this.modifiers,
        required this.description,
        required this.skill,
        required this.skillName,
    });

    factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        level: json["level"],
        modifiers: Map.from(json["modifiers"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
        description: json["description"],
        skill: json["skill"],
        skillName: json["skillName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "level": level,
        "modifiers": Map.from(modifiers).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "description": description,
        "skill": skill,
        "skillName": skillName,
    };
}
