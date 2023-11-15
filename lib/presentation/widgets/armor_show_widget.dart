import 'package:flutter/material.dart';
import 'package:po2_mhwdata/models/armor_model.dart';
import 'package:po2_mhwdata/presentation/widgets/armor_info_widgets.dart';
import 'package:po2_mhwdata/presentation/widgets/page_show_widget.dart';

List<Color> rarityColors = [
  Colors.white,
  Colors.purple[100]!,
  Colors.yellow[100]!,
  Colors.pink[100]!,
  Colors.blueGrey[100]!,
  Colors.blue[200]!,
  Colors.red[200]!,
  Colors.cyan[300]!,
  Colors.pink[300]!,
  Colors.purple[600]!,
  Colors.yellow[400]!,
  Colors.orange[400]!
];


class ArmorsWidget extends StatelessWidget {
  const ArmorsWidget({
    super.key,
    required this.armors,
  });

  final List<Armor> armors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: armors.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                Icon(Icons.radio_button_checked_sharp,
                    color: rarityColors[(armors[index].rarity) - 1]),
                const SizedBox(
                  width: 10,
                ),
                Text(armors[index].name),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            contentPadding: const EdgeInsets.all(0),
                            content: DefaultTabController(
                              length: 3,
                              child: Scaffold(
                                body: TabBarView(children: [
                                  ArmorDefenseInfo(armor: armors[index]),
                                  ArmorSkillsInfo(armor: armors[index]),
                                  ArmorRecipeInfo(armor: armors[index])
                                ]),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Icon(Icons.more_horiz_outlined))
              ],
            ),
          );
        },
      ),
    );
  }
}

