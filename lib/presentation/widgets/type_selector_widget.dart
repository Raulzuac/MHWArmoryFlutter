import 'package:flutter/material.dart';

class TypeSelectorWidget extends StatefulWidget {
  
  final  List<String> itemlist;
  final  VoidCallbackAction action;
  String selected = 'Selecciona';
  TypeSelectorWidget({super.key,required this.itemlist,required this.action});

  @override
  State<TypeSelectorWidget> createState() => _TypeSelectorWidgetState();
}

class _TypeSelectorWidgetState extends State<TypeSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.green.shade700,width: 4),
                  borderRadius: BorderRadius.circular(20)
                  
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Armor part ',
                        style: TextStyle(fontSize: 20),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          border: Border.all(color: Colors.green.shade700,width: 4),
                          borderRadius: BorderRadius.circular(20)
                          ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            underline: Container(),
                            icon: const Icon(Icons.shield),
                            value: widget.selected,
                            style: const TextStyle(fontSize: 20),
                            items: widget.itemlist.map<DropdownMenuItem<String>>((e) {
                              return DropdownMenuItem<String>(
                                value: e,
                                child: Text(
                                  e,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                widget.action;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }
}