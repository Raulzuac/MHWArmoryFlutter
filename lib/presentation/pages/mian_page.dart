import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:po2_mhwdata/models/armor_model.dart';
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
          frontLayer: Padding(
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
                                      // appBar: AppBar(
                                      //   leading: Icon(Icons.abc,color: null,),
                                      //   leadingWidth: 0,
                                      //   flexibleSpace: Center(child: Text(armors[index].name,style: TextStyle(fontSize: 20),)),
                                      //   ),

                                      body: Container(
                                        child: TabBarView(children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'Elemental resistances',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image(
                                                      image: NetworkImage(
                                                          'https://static.wikia.nocookie.net/monsterhunter/images/a/ae/Status_Effect-Dragonblight_MH4_Icon.png/revision/latest/scale-to-width-down/40?cb=20210117171415')),
                                                  Text(
                                                      ' ${armors[index].resistances.dragon}'),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image(
                                                      image: NetworkImage(
                                                          'https://static.wikia.nocookie.net/monsterhunter/images/a/a7/Status_Effect-Fireblight_MH4_Icon.png/revision/latest/scale-to-width-down/40?cb=20131017115239')),
                                                  Text(
                                                      ' ${armors[index].resistances.fire}'),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image(
                                                      image: NetworkImage(
                                                          'https://static.wikia.nocookie.net/monsterhunter/images/a/ac/Status_Effect-Thunderblight_MH4_Icon.png/revision/latest/scale-to-width-down/40?cb=20131017124807')),
                                                  Text(
                                                      ' ${armors[index].resistances.thunder}'),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image(
                                                      image: NetworkImage(
                                                          'https://static.wikia.nocookie.net/monsterhunter/images/1/16/Status_Effect-Waterblight_MH4_Icon.png/revision/latest/scale-to-width-down/40?cb=20131017122916')),
                                                  Text(
                                                      ' ${armors[index].resistances.water}'),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image(
                                                      image: NetworkImage(
                                                          'https://static.wikia.nocookie.net/monsterhunter/images/6/6c/Status_Effect-Iceblight_MH4_Icon.png/revision/latest/scale-to-width-down/40?cb=20131011074508')),
                                                  Text(
                                                      ' ${armors[index].resistances.ice}'),
                                                ],
                                              ),
                                              Text('Defense'),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image(image: NetworkImage('https://static.wikia.nocookie.net/monsterhunter/images/9/99/StatusEffect-Defense_Up_Icon_MHRS.svg/revision/latest/scale-to-width-down/40?cb=20220803225004')),
                                                  Text(' ${armors[index].defense.base}- ${armors[index].defense.max}')
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 20,
                                                    height: 5,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                        color: Colors.grey),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                    width: 5,
                                                    height: 5,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                        color: Colors.grey),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                    width: 5,
                                                    height: 5,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              const Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text('Skills'),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: 
                                                      armors[index].skills.map((element) {
                                                        return Text('${element.skillName} ${element.level}:\n ${element.description}');
                                                      }).toList()
                                                    
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 5,
                                                      height: 5,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
                                                          color: Colors.grey),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      width: 20,
                                                      height: 5,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
                                                          color: Colors.grey),
                                                    ),
                                                    
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      width: 5,
                                                      height: 5,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              const Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text('Recipe'),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: armors[index].crafting.materials.map((element) {
                                                    return Text('${element.item.name} X ${element.quantity}');
                                                  }).toList(),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 5,
                                                      height: 5,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
                                                          color: Colors.grey),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    
                                                    Container(
                                                      width: 5,
                                                      height: 5,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
                                                          color: Colors.grey),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      width: 20,
                                                      height: 5,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ]),
                                      ),
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
          )),
    );
  }
}
