part of 'characters_cubit.dart';

abstract class CharactersState extends Equatable {}

class CharactersInitial extends CharactersState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CharactersLoadingState extends CharactersState{
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CharactersLoadedState extends CharactersState{
  final List<CharactersModel> characters;

  CharactersLoadedState({required this.characters});
  @override
  List<Object?> get props => [characters];
}

class CharactersErrorState extends CharactersState{
  final String message;

  CharactersErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
class SearchLoadingState extends CharactersState{
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SearchSuccessState extends CharactersState{
  final List<CharactersModel> charactersSearchedList;

  SearchSuccessState({required this.charactersSearchedList});
    @override
  List<Object?> get props => throw UnimplementedError();
}




