import 'package:equatable/equatable.dart';

class CharactersModel extends Equatable {
  final int charId;
  final String name;
  final String birthday;
  final List<dynamic> jobs;
  final List<dynamic> apperanceSeason;
  final String img;
  final String status;
  final String nickname;
  final String portrayed;
  final String category;
  final List<dynamic> betterCallSaulAppearance;

  const CharactersModel({
    required this.charId,
    required this.name,
    required this.birthday,
    required this.jobs,
    required this.apperanceSeason,
    required this.img,
    required this.status,
    required this.nickname,
    required this.portrayed,
    required this.category,
    required this.betterCallSaulAppearance
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    return CharactersModel(
      charId: json['char_id'],
      name: json['name'],
      birthday: json['birthday'],
      jobs: json['occupation'] ,
      apperanceSeason: json['appearance'],
      img: json['img'],
      status: json['status'],
      nickname: json['nickname'],
      portrayed: json['portrayed'],
      category: json['category'],
      betterCallSaulAppearance:json['better_call_saul_appearance'],
    );
  }

  @override
  List<Object?> get props => [
        charId,
        name,
        birthday,
        jobs,
        apperanceSeason,
        img,
        status,
        nickname,
        portrayed,
        category,
        betterCallSaulAppearance,
      ];
}
