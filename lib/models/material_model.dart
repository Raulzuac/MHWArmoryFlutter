import 'package:po2_mhwdata/models/item_model.dart';

class Material {
    final int quantity;
    final Item item;

    Material({
        required this.quantity,
        required this.item,
    });

    factory Material.fromJson(Map<String, dynamic> json) => Material(
        quantity: json["quantity"],
        item: Item.fromJson(json["item"]),
    );

    Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "item": item.toJson(),
    };
}