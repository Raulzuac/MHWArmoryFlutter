import 'dart:convert';

import 'package:http/http.dart';
import 'package:po2_mhwdata/models/armor_model.dart';

class ArmorProvider{
  Future<List<Armor>> getArmors(String part,String rank)async{
    String endpoint = 'https://mhw-db.com/armor?q={"type":"$part","rank":"$rank"}';
    Response r =await get(Uri.parse(endpoint));
    return armorFromJson(r.body);
  }
}