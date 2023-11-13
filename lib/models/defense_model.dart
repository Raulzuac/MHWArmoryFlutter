class Defense {
    final int base;
    final int max;
    final int augmented;

    Defense({
        required this.base,
        required this.max,
        required this.augmented,
    });

    factory Defense.fromJson(Map<String, dynamic> json) => Defense(
        base: json["base"],
        max: json["max"],
        augmented: json["augmented"],
    );

    Map<String, dynamic> toJson() => {
        "base": base,
        "max": max,
        "augmented": augmented,
    };
}