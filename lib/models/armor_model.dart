// To parse this JSON data, do
//
//     final armor = armorFromJson(jsonString);

import 'dart:convert';

import 'package:po2_mhwdata/models/armor_set_model.dart';
import 'package:po2_mhwdata/models/crafting_model.dart';
import 'package:po2_mhwdata/models/defense_model.dart';
import 'package:po2_mhwdata/models/resistances_model.dart';
import 'package:po2_mhwdata/models/skill_model.dart';
import 'package:po2_mhwdata/models/slot_model.dart';

List<Armor> armorFromJson(String str) => List<Armor>.from(json.decode(str).map((x) => Armor.fromJson(x)));

String armorToJson(List<Armor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Armor {
    final int id;
    final String type;
    final String rank;
    final int rarity;
    final Defense defense;
    final Resistances resistances;
    final String name;
    final List<Slot> slots;
    final List<Skill> skills;
    final ArmorSet armorSet;
    final dynamic assets;
    final Crafting crafting;

    Armor({
        required this.id,
        required this.type,
        required this.rank,
        required this.rarity,
        required this.defense,
        required this.resistances,
        required this.name,
        required this.slots,
        required this.skills,
        required this.armorSet,
        required this.assets,
        required this.crafting,
    });

    factory Armor.fromJson(Map<String, dynamic> json) => Armor(
        id: json["id"],
        type: json["type"],
        rank: json["rank"],
        rarity: json["rarity"],
        defense: Defense.fromJson(json["defense"]),
        resistances: Resistances.fromJson(json["resistances"]),
        name: json["name"],
        slots: List<Slot>.from(json["slots"].map((x) => Slot.fromJson(x))),
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        armorSet: ArmorSet.fromJson(json["armorSet"]),
        assets: json["assets"],
        crafting: Crafting.fromJson(json["crafting"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "rank": rank,
        "rarity": rarity,
        "defense": defense.toJson(),
        "resistances": resistances.toJson(),
        "name": name,
        "slots": List<dynamic>.from(slots.map((x) => x.toJson())),
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "armorSet": armorSet.toJson(),
        "assets": assets,
        "crafting": crafting.toJson(),
    };
}















