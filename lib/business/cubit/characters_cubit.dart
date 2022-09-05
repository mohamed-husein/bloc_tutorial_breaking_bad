import 'package:bloc_tutorial/core/errors/failure.dart';
import 'package:bloc_tutorial/core/utils/app_strings/app_strings.dart';
import 'package:bloc_tutorial/data/model/characters_model.dart';
import 'package:bloc_tutorial/data/repository/characters_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit({required this.charactersRepository})
      : super(CharactersInitial());
  final CharactersRepository charactersRepository;
  List<CharactersModel> allCharacters = [];

  final controller = TextEditingController();
  bool isSearch = false;


  Future<void> getAllCharacters() async {
    final result = await charactersRepository.getAllCharacters();
    result.fold(
      (l) => emit(
        CharactersErrorState(
          message: _mapFailureToMsg(
            l,
          ),
        ),
      ),
      (r) {
        allCharacters = r;
        emit(
          CharactersLoadedState(characters: r),
        );
      },
    );
  }
  

  void searchedCharacters(String charName) {
    emit(SearchLoadingState());
    final result = allCharacters
        .where((charactersName) =>
            charactersName.name.toLowerCase().startsWith(charName))
        .toList();
    emit(SearchSuccessState(charactersSearchedList: result));
  }


  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.sreverFailure;
      default:
        return 'Unexpected Error';
    }
  }
}
