import 'package:flutter/material.dart';

const int pokeMaxId = 898;
const String pokeApiRoute = "https://pokeapi.co/api/v2";
const Map<String, Color> pokeTypeColors = {
  "ノーマル": Color(0xFFA8A77A),
  "ほのお": Color(0xFFEE8130),
  "みず": Color(0xFF6390F0),
  "でんき": Color(0xFFF7D02C),
  "くさ": Color(0xFF7AC74C),
  "こおり": Color(0xFF96D9D6),
  "かくとう": Color(0xFFC22E28),
  "どく": Color(0xFFA33EA1),
  "じめん": Color(0xFFE2BF65),
  "ひこう": Color(0xFFA98FF3),
  "エスパー": Color(0xFFF95587),
  "むし": Color(0xFFA6B91A),
  "いわ": Color(0xFFB6A136),
  "ゴースト": Color(0xFF735797),
  "ドラゴン": Color(0xFF6F35FC),
  "あく": Color(0xFF705746),
  "はがね": Color(0xFFB7B7CE),
  "フェアリー": Color(0xFFD685AD),
};
