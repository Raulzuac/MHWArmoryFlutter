import 'package:po2_mhwdata/models/material_model.dart';

class Crafting {
    final List<Material> materials;

    Crafting({
        required this.materials,
    });

    factory Crafting.fromJson(Map<String, dynamic> json) => Crafting(
        materials: List<Material>.from(json["materials"].map((x) => Material.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "materials": List<dynamic>.from(materials.map((x) => x.toJson())),
    };
}
