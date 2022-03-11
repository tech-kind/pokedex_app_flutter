import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';
import '../const/const.dart';

Future<Pokemon> fetchPokemon(int id) async {
  final res = await http.get(Uri.parse('$pokeApiRoute/pokemon/$id'));
  if (res.statusCode != 200) {
    throw Exception('Failed to Load Pokemon');
  }

  final json = jsonDecode(res.body);
  final nameUrl = json['species']['url'];
  final nameRes = await http.get(Uri.parse(nameUrl));

  if (nameRes.statusCode != 200) {
    throw Exception('Failed to Load Pokemon');
  }

  final nameJson = jsonDecode(nameRes.body);

  List<String> ret = [];
  for (int i = 0; i < json['types'].length; i++) {
    final typeUrl = json['types'][i]['type']['url'];
    final typeRes = await http.get(Uri.parse(typeUrl));
    if (typeRes.statusCode != 200) {
      throw Exception('Failed to Load Pokemon');
    }
    final typeJson = jsonDecode(typeRes.body);
    ret.add(typeJson['names'][0]['name']);
  }

  final poke = Pokemon(
      id: json['id'],
      name: nameJson['names'][0]['name'],
      types: ret,
      imageUrl: json['sprites']['other']['official-artwork']['front_default']);

  return Pokemon.fromJson(poke);
}
