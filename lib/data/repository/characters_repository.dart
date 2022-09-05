import 'package:bloc_tutorial/core/errors/exception.dart';
import 'package:bloc_tutorial/core/errors/failure.dart';
import 'package:bloc_tutorial/data/model/characters_model.dart';
import 'package:bloc_tutorial/data/web_services/characters_web_services.dart';
import 'package:dartz/dartz.dart';




class CharactersRepository
{
  final CharactersWebServices charatersWebServices;

  CharactersRepository({required this.charatersWebServices});

  Future<Either<Failure,List<CharactersModel>>> getAllCharacters()async
  {
    try 
    {
      final character = await charatersWebServices.getAllCharacters();
      return Right(character);
    }
    on ServerException
    {
      return Left(ServerFailure());
    }
  }

 
}