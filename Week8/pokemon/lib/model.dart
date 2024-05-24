import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_sprite/flutter_sprite.dart';

part 'model.g.dart';

@JsonSerializable()
class Pokemon {

  final int id;
  final String name;
  final int weight;
  final Sprites sprites;

  Pokemon({
    required this.id,
    required this.name,
    required this.weight,
    required this.sprites,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

// @JsonSerializable()
// class Stats {
//
//   final List<TypeWrapper> types;
//   final List<HabitatWrapper> habitats;
//   final List<FormWrapper> forms;
//
//   Stats({
//     required this.types,
//     required this.habitats,
//     required this.forms,
//   });
//
//   factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
//   Map<String, dynamic> toJson() => _$StatsToJson(this);
// }
//
// @JsonSerializable()
// class TypeWrapper {
//   final Type type;
//
//   TypeWrapper({required this.type});
//
//   factory TypeWrapper.fromJson(Map<String, dynamic> json) => _$TypeWrapperFromJson(json);
//   Map<String, dynamic> toJson() => _$TypeWrapperToJson(this);
// }
//
// @JsonSerializable()
// class Type {
//   final String name;
//
//   Type({required this.name});
//
//   factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
//   Map<String, dynamic> toJson() => _$TypeToJson(this);
// }
//
// @JsonSerializable()
// class HabitatWrapper {
//   final Habitat habitat;
//
//   HabitatWrapper({required this.habitat});
//
//   factory HabitatWrapper.fromJson(Map<String, dynamic> json) => _$HabitatWrapperFromJson(json);
//   Map<String, dynamic> toJson() => _$HabitatWrapperToJson(this);
// }
//
// @JsonSerializable()
// class Habitat {
//   final String name;
//
//   Habitat({required this.name});
//
//   factory Habitat.fromJson(Map<String, dynamic> json) => _$HabitatFromJson(json);
//   Map<String, dynamic> toJson() => _$HabitatToJson(this);
// }
//
// @JsonSerializable()
// class FormWrapper {
//   final Form form;
//
//   FormWrapper({required this.form});
//
//   factory FormWrapper.fromJson(Map<String, dynamic> json) => _$FormWrapperFromJson(json);
//   Map<String, dynamic> toJson() => _$FormWrapperToJson(this);
// }
//
// @JsonSerializable()
// class Form {
//   final String name;
//
//   Form({required this.name});
//
//   factory Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);
//   Map<String, dynamic> toJson() => _$FormToJson(this);
// }

@JsonSerializable()
class Sprites {
  final String front_default;
  final String back_default;
  Sprites({
    required this.front_default,
    required this.back_default,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);
  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}