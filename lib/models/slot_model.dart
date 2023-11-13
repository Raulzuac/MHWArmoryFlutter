class Slot {
    final int rank;

    Slot({
        required this.rank,
    });

    factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        rank: json["rank"],
    );

    Map<String, dynamic> toJson() => {
        "rank": rank,
    };
}


