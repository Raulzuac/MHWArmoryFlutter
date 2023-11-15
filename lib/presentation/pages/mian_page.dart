import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:po2_mhwdata/models/armor_model.dart';
import 'package:po2_mhwdata/presentation/widgets/armor_show_widget.dart';
import 'package:po2_mhwdata/presentation/widgets/type_selector_widget.dart';
import 'package:po2_mhwdata/providers/armor_provider.dart';

const ranks = ['Low', 'High', 'Master'];
const skills = [];
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

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Armor> armors = [];
  final rankList = ranks;
  String selectedRank = ranks.first;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackdropScaffold(
          headerHeight: 500,
          appBar: BackdropAppBar(
            titleSpacing: BorderSide.strokeAlignCenter,
            backgroundColor: Colors.grey[800],
            title: const Text(
              'Monster hunter armory',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backLayerBackgroundColor: Colors.grey[700],
          backLayer: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Select the rank of the armor:',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownMenu<String>(
                  textStyle: const TextStyle(color: Colors.white),
                  menuStyle: const MenuStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.grey),
                  ),
                  initialSelection: ranks.first,
                  onSelected: (String? value) {
                    setState(() {
                      selectedRank = value!;
                      print(selectedRank);
                    });
                  },
                  dropdownMenuEntries:
                      rankList.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                        value: value, label: '$value rank');
                  }).toList(),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Selecciona el tipo de armadura',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.green)),
                          onPressed: () async {
                            armors = await ArmorProvider()
                                .getArmors('head', selectedRank.toLowerCase());
                            setState(() {});
                            print('Traeme los cascos');
                          },
                          child: const Image(
                              image: NetworkImage(
                                  'https://static.wikia.nocookie.net/fanonmonsterhunter/images/c/c3/Helmet_Icon_White.png/revision/latest?cb=20160106224004'))),
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.green)),
                          onPressed: () async {
                            armors = await ArmorProvider()
                                .getArmors('chest', selectedRank.toLowerCase());
                            setState(() {});
                            print('Pintame los petos');
                          },
                          child: const Image(
                              image: NetworkImage(
                                  'https://static.wikia.nocookie.net/fanonmonsterhunter/images/2/28/Chest_Icon_White.png/revision/latest?cb=20160106224702'))),
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.green)),
                          onPressed: () async {
                            armors = await ArmorProvider().getArmors(
                                'gloves', selectedRank.toLowerCase());
                            setState(() {});
                            print('Pintame los cintos');
                          },
                          child: const Image(
                              image: NetworkImage(
                                  'https://static.wikia.nocookie.net/fanonmonsterhunter/images/b/bf/Arm_Icon_White.png/revision/latest?cb=20160106225258'))),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.green)),
                        onPressed: () async {
                          armors = await ArmorProvider()
                              .getArmors('waist', selectedRank.toLowerCase());
                          setState(() {});
                          print('Pintame los pantalones');
                        },
                        child: const Image(
                            image: NetworkImage(
                                'https://static.wikia.nocookie.net/fanonmonsterhunter/images/2/22/Waist_Icon_White.png/revision/latest?cb=20160106230357'))),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.green)),
                        onPressed: () async {
                          armors = await ArmorProvider()
                              .getArmors('legs', selectedRank.toLowerCase());
                          setState(() {});
                          print('Pintame las botas');
                        },
                        child: const Image(
                            image: NetworkImage(
                                'https://static.wikia.nocookie.net/fanonmonsterhunter/images/c/c4/Leg_Icon_White.png/revision/latest?cb=20160106230351'))),
                  ],
                ),
              ],
            ),
          ),
          frontLayer: armors.isEmpty
          ?const Center(child: Text('Select the Rank and the type of the armor you want.\n(In the upper menu)',
          style: TextStyle(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,))
          :ArmorsWidget(armors: armors)),
    );
  }
}

