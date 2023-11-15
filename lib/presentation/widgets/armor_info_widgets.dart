import 'package:flutter/material.dart';
import 'package:po2_mhwdata/models/armor_model.dart';
import 'package:po2_mhwdata/presentation/widgets/page_show_widget.dart';

List<Widget> getArmorSkills(Armor armor) {
  return armor.skills.map((element) {
    return Text(
        '${element.skillName} ${element.level}:\n${element.description}');
  }).toList();
}

List<Widget> getArmorMaterials(Armor armor) {
  return armor.crafting.materials.map((element) {
    return Text('${element.item.name} X ${element.quantity}');
  }).toList();
}


class ArmorRecipeInfo extends StatelessWidget {
  const ArmorRecipeInfo({
    super.key,
    required this.armor,
  });

  final Armor armor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            'Recipe',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
              children: armor
                      .crafting
                      .materials
                      .isEmpty
                  ? [
                      const Text(
                          'No data of this crafting')
                    ]
                  : getArmorMaterials(
                      armor)),
        ),
        const PageShowWidget(selected: 3)
      ],
    );
  }
}

class ArmorSkillsInfo extends StatelessWidget {
  const ArmorSkillsInfo({super.key, required this.armor});
  final Armor armor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            'Skills',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getArmorSkills(armor)),
          ),
        ),
        const PageShowWidget(selected: 2,)
      ],
    );
  }
}



class ArmorDefenseInfo extends StatelessWidget {
  const ArmorDefenseInfo({
    super.key,
    required this.armor,
  });

  final Armor armor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Padding(
          padding:  EdgeInsets.only(top:30),
          child: Text(
              'Elemental resistances',
              style: TextStyle(fontSize: 20),
            ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: NetworkImage(
                      'https://static.wikia.nocookie.net/monsterhunter/images/a/ae/Status_Effect-Dragonblight_MH4_Icon.png/revision/latest/scale-to-width-down/40?cb=20210117171415')),
              Text(' ${armor.resistances.dragon}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: NetworkImage(
                      'https://static.wikia.nocookie.net/monsterhunter/images/a/a7/Status_Effect-Fireblight_MH4_Icon.png/revision/latest/scale-to-width-down/40?cb=20131017115239')),
              Text(' ${armor.resistances.fire}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: NetworkImage(
                      'https://static.wikia.nocookie.net/monsterhunter/images/a/ac/Status_Effect-Thunderblight_MH4_Icon.png/revision/latest/scale-to-width-down/40?cb=20131017124807')),
              Text(' ${armor.resistances.thunder}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: NetworkImage(
                      'https://static.wikia.nocookie.net/monsterhunter/images/1/16/Status_Effect-Waterblight_MH4_Icon.png/revision/latest/scale-to-width-down/40?cb=20131017122916')),
              Text(' ${armor.resistances.water}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: NetworkImage(
                      'https://static.wikia.nocookie.net/monsterhunter/images/6/6c/Status_Effect-Iceblight_MH4_Icon.png/revision/latest/scale-to-width-down/40?cb=20131011074508')),
              Text(' ${armor.resistances.ice}'),
            ],
          ),
          const Text('Defense'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: NetworkImage(
                      'https://static.wikia.nocookie.net/monsterhunter/images/9/99/StatusEffect-Defense_Up_Icon_MHRS.svg/revision/latest/scale-to-width-down/40?cb=20220803225004')),
              Text(' ${armor.defense.base}- ${armor.defense.max}')
            ],
          ),
            ],
          ),
        ),
        const PageShowWidget(selected: 1)
      ],
    );
  }
}
